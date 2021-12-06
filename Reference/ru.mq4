 
#property strict

 

#define SOCKET_LIBRARY_USE_EVENTS
#include <socket-library-mt4-mt5.mqh>
 
input ushort   ResiverID    = 27401;  // Server port
input int      slippage     = 10000; 
input int      MaxTimeOpen  = 1200;
input int      MaxTimeClose = 1200;

ushort   ServerPort = 23456;  // Server port


 
#define TIMER_FREQUENCY_MS    1000

// Server socket
ServerSocket * glbServerSocket = NULL;

// Array of current clients
ClientSocket * glbClients[];

// Watch for need to create timer;
bool glbCreatedTimer = false;


// --------------------------------------------------------------------
// Initialisation - set up server socket
// --------------------------------------------------------------------
int dig =5;
void OnInit()
{  ServerPort = ResiverID;
   dig = int (SymbolInfoInteger(Symbol(),SYMBOL_DIGITS)  );
   // If the EA is being reloaded, e.g. because of change of timeframe,
   // then we may already have done all the setup. See the 
   // termination code in OnDeinit.
   if (glbServerSocket) {
      Print("Reloading EA with existing server socket");
   } else {
      // Create the server socket
      glbServerSocket = new ServerSocket(ServerPort, false);
      if (glbServerSocket.Created()) {
         Print("Server socket created");
   
         // Note: this can fail if MT4/5 starts up
         // with the EA already attached to a chart. Therefore,
         // we repeat in OnTick()
         glbCreatedTimer = EventSetMillisecondTimer(TIMER_FREQUENCY_MS);
      } else {
         Print("Server socket FAILED - is the port already in use?");
      }
   }
}


// --------------------------------------------------------------------
// Termination - free server socket and any clients
// --------------------------------------------------------------------

void OnDeinit(const int reason)
{
   switch (reason) {
      case REASON_CHARTCHANGE:
         // Keep the server socket and all its clients if 
         // the EA is going to be reloaded because of a 
         // change to chart symbol or timeframe 
         break;
         
      default:
         // For any other unload of the EA, delete the 
         // server socket and all the clients 
         glbCreatedTimer = false;
         
         // Delete all clients currently connected
         for (int i = 0; i < ArraySize(glbClients); i++) {
            delete glbClients[i];
         }
         ArrayResize(glbClients, 0);
      
         // Free the server socket. *VERY* important, or else
         // the port number remains in use and un-reusable until
         // MT4/5 is shut down
         delete glbServerSocket;
         glbServerSocket = NULL;
         Print("Server socket terminated");
         break;
   }
}


// --------------------------------------------------------------------
// Timer - accept new connections, and handle incoming data from clients.
// Secondary to the event-driven handling via OnChartEvent(). Most
// socket events should be picked up faster through OnChartEvent()
// rather than being first detected in OnTimer()
// --------------------------------------------------------------------

void OnTimer()
{
   // Accept any new pending connections
   AcceptNewConnections();
   
   // Process any incoming data on each client socket,
   // bearing in mind that HandleSocketIncomingData()
   // can delete sockets and reduce the size of the array
   // if a socket has been closed

   for (int i = ArraySize(glbClients) - 1; i >= 0; i--) {
      HandleSocketIncomingData(i);
   }
}


// --------------------------------------------------------------------
// Accepts new connections on the server socket, creating new
// entries in the glbClients[] array
// --------------------------------------------------------------------

void AcceptNewConnections()
{
   // Keep accepting any pending connections until Accept() returns NULL
   ClientSocket * pNewClient = NULL;
   do {
      pNewClient = glbServerSocket.Accept();
      if (pNewClient != NULL) {
         int sz = ArraySize(glbClients);
         ArrayResize(glbClients, sz + 1);
         glbClients[sz] = pNewClient;
         Print("New client connection");
         
         pNewClient.Send("Ru is Connecting wthi ID : "+ IntegerToString(ServerPort) );
      }
      
   } while (pNewClient != NULL);
}


// --------------------------------------------------------------------
// Handles any new incoming data on a client socket, identified
// by its index within the glbClients[] array. This function
// deletes the ClientSocket object, and restructures the array,
// if the socket has been closed by the client
// --------------------------------------------------------------------

void HandleSocketIncomingData(int idxClient)
{
   ClientSocket * pClient = glbClients[idxClient];

   // Keep reading CRLF-terminated lines of input from the client
   // until we run out of new data
   bool bForceClose = false; // Client has sent a "close" message
   string strCommand;
   do {
      strCommand = pClient.Receive();
      if(StringLen(strCommand)>6  ){
         runOrder(strCommand , pClient );
      }
      
      
       
   } while (strCommand != "");

   // If the socket has been closed, or the client has sent a close message,
   // release the socket and shuffle the glbClients[] array
   if (!pClient.IsSocketConnected() || bForceClose) {
      Print("Client has disconnected");

      // Client is dead. Destroy the object
      delete pClient;
      
      // And remove from the array
      int ctClients = ArraySize(glbClients);
      for (int i = idxClient + 1; i < ctClients; i++) {
         glbClients[i - 1] = glbClients[i];
      }
      ctClients--;
      ArrayResize(glbClients, ctClients);
   }
}


// --------------------------------------------------------------------
// Use OnTick() to watch for failure to create the timer in OnInit()
// --------------------------------------------------------------------

void OnTick()
{
   if (!glbCreatedTimer) glbCreatedTimer = EventSetMillisecondTimer(TIMER_FREQUENCY_MS);
}

// --------------------------------------------------------------------
// Event-driven functionality, turned on by #defining SOCKET_LIBRARY_USE_EVENTS
// before including the socket library. This generates dummy key-down
// messages when socket activity occurs, with lparam being the 
// .GetSocketHandle()
// --------------------------------------------------------------------

void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
{
   if (id == CHARTEVENT_KEYDOWN) {
      // If the lparam matches a .GetSocketHandle(), then it's a dummy
      // key press indicating that there's socket activity. Otherwise,
      // it's a real key press
         
      if (lparam == glbServerSocket.GetSocketHandle()) {
         // Activity on server socket. Accept new connections
         Print("New server socket event - incoming connection");
         AcceptNewConnections();

      } else {
         // Compare lparam to each client socket handle
         for (int i = 0; i < ArraySize(glbClients); i++) {
            if (lparam == glbClients[i].GetSocketHandle()) {
               HandleSocketIncomingData(i);
               return; // Early exit
            }
         }
         
         // If we get here, then the key press does not seem
         // to match any socket, and appears to be a real
         // key press event...
      }
   }
}


















//*********************************************************************************************************************
ulong time = GetTickCount();
void runOrder(string msg , ClientSocket * pClient){    //701=1@1@ID@2@Size@3@Comment@4@price@5@
                              //702=0@1@ID@2@Size@3@Comment@4@price@5@
                              //703=7@1@ID@2@Size@3@Comment@4@price@5@
        string IDs  = StringSubstr(msg,8,StringFind (msg,"@2@",0) - 8 );
        //string id   = StringSubstr(IDs,0,StringFind (IDs,"::",0) );
        //string sy   = StringSubstr(IDs,StringFind (IDs,"::",0) + 2 , StringLen(IDs) );
        string size = StringSubstr(msg, StringFind (msg,"@2@",0)+3  , StringFind (msg,"@3@",0) - StringFind (msg,"@2@",0) - 3 );
        string Comm = StringSubstr(msg, StringFind (msg,"@3@",0)+3  , StringFind (msg,"@4@",0) - StringFind (msg,"@3@",0) - 3 );
        string MyID = IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) + "::"+Symbol();                           
         c(msg);              
         if ( StringSubstr(msg,0,5)=="701=1" ){// Sell Case      
                if( (MyID==IDs) && (isTradeExixt(Comm)==0) ){
                    
                      //https://book.mql4.com/trading/ordersend
                      
                      time = GetTickCount();
                      ulong timeout = time + MaxTimeOpen ;  
                      bool OrderOpen = false ;
                      c("Ask for Slippage : "+Ask_(Bid));
                      for(;!OrderOpen;){
                         double Bid_ = Bid;
                         int ticket = OrderSend(Symbol(),OP_SELL,StringToDouble(size) ,Bid,1,0,0,Comm);
                         if(ticket>1){
                              OrderOpen = true;
                              string msgRes  = "SELL OK " + Symbol()+" at:"+Ask_(Bid);
                                     msgRes += "Slippage="+Ask_(Bid_ - Bid)+"Execution="+IntegerToString(GetTickCount()-time) ;
                              pClient.Send(msgRes);  
                              c( msgRes  );
                              c("Ask for Slippage : "+Ask_(Bid));    
                           }else{
                                    if( GetTickCount()>timeout ){
                                       c("Time Out For Opening Sell Order ");
                                       pClient.Send("TimeOut="+IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) );
                                       c(IntegerToString(GetTickCount()-time));
                                       OrderOpen = true;
                                    }
                           
                           }
                           
                      }
                      
                      
                }
        }else{          
                   if ( StringSubstr(msg,0,5)=="702=0" ){// Buy Case        
                            if( (MyID==IDs) && (isTradeExixt(Comm)==0) ){
                                  //https://book.mql4.com/trading/ordersend
                                
                                   time = GetTickCount();
                                   ulong timeout = time + MaxTimeOpen ;  
                                   bool OrderOpen = false ;
                                   c("Ask for Slippage : "+Ask_(Ask));
                                   for(;!OrderOpen;){
                                       double Ask_2 = Ask;     
                                       int ticket = OrderSend(Symbol(),OP_BUY, StringToDouble(size) ,Ask,slippage,0,0,Comm);
                                       if(ticket>1){
                                          OrderOpen = true;
                                          string msgRes  = "BUY OK " + Symbol()+" at:"+Ask_(Ask);
                                                 msgRes += "Slippage="+Ask_(Ask_2 - Ask)+"Execution="+IntegerToString(GetTickCount()-time) ;
                                          pClient.Send(msgRes);  
                                          c( msgRes  );  
                                          c("Ask for Slippage : "+Ask_(Bid));   
                                       }else{
                                              if( GetTickCount()>timeout ){
                                                   c("Time Out For Opening Buy Order ");
                                                   pClient.Send("TimeOut="+IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) );
                                                   c(IntegerToString(GetTickCount()-time));
                                                   OrderOpen = true;
                                                }  
                                       }
                                  
                                  }
                                  
                            }//
                       }else{ 
                        
                                  if ( StringSubstr(msg,0,5)=="703=7" ){// Close Case        
                                           if( MyID==IDs ){
                                                 //https://book.mql4.com/trading/ordersend
                                                 // Slepeg =100
                                                 //int m = OrderSend(Symbol(),OP_BUY, StringToDouble(size) ,Ask,100,0,0,Comm);
                                                  
                                                 CloseOrder(Comm , pClient);
                                           }
                                      }            
   
                       }
  
         }

}



























void CloseOrder( string comm , ClientSocket * pClient ){
      
      
       for(int order_counter = 0; order_counter < OrdersTotal(); order_counter ++)
      {  
         if(OrderSelect(order_counter, SELECT_BY_POS, MODE_TRADES) == true && OrderSymbol() == Symbol())
         {
             if( OrderComment() == comm ){ 
                  
                  //int m = OrderClose( OrderTicket() ,OrderLots(),0 ,4,Red);
                  double Price = Ask;
                  if(OrderType()==0) Price=Bid;
                  
                  
                  //*******************************************
                  time = GetTickCount();
                  ulong timeout = time + MaxTimeClose ;  
                  bool OrderOpen = false ;
                  c("------------------------------Close for Slippage : "+Ask_(Price));
                  for(;!OrderOpen;){
                        double Price2 = Ask;  if(OrderType()==0) Price2=Bid;
                        int ticket = OrderClose(OrderTicket(),OrderLots(),Price2,slippage,Red);
                  
                        if(ticket==true){
                                       OrderOpen = true;
                                       string msgRes  = "Close OK " + Symbol()+" at:"+Ask_(Price2);
                                       msgRes += "Slippage="+Ask_(Price - Price2)+"Execution="+IntegerToString(GetTickCount()-time) ;
                                       pClient.Send(msgRes);  
                                       c( msgRes  );  
                                       c("------------------------------Close for Slippage : "+Ask_(Price2));   
                            }else{
                            
                                           if( GetTickCount()>timeout ){
                                                   c("Time Out For Closeing Order ");
                                                   pClient.Send("TimeOut="+IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) );
                                                   c("-------------------------"+IntegerToString(GetTickCount()-time));
                                                   OrderOpen = true;
                                                }  
                            
                            
                            
                            }
                  
                  
                  }//Fin For Loop
                  
                  
                  
                  
             } 
         }
         
      }   
      
}





int isTradeExixt( string comm){
      int res = 0;// Non 

       for(int order_counter = 0; order_counter < OrdersTotal(); order_counter ++)
      {  
         if(OrderSelect(order_counter, SELECT_BY_POS, MODE_TRADES) == true && OrderSymbol() == Symbol())
         {
             if( OrderComment() == comm ){
                  res = OrderTicket() ;// Yes 
             } 
         }
         
      }   
      return res ;
}









string Ask_( double ask_ ){
   string aa =DoubleToString(ask_);
   
  aa = StringSubstr(aa, 0 , StringFind(aa,".")+1+dig)    ;
   
   return aa;

}




void c( string str ){
   
   Print(str);

}