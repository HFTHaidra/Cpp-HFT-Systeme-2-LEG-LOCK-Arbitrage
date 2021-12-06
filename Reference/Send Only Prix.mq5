// used Fix Haidra
// Usd Prot '2700' For All CLIENTs (Send Data To 2700) &&  Reseive Ports 2701-2702-2703-2704.... (2700+Id)  
//
// --------------------------------------------------------------------
// Include socket library
// --------------------------------------------------------------------

#property strict

// --------------------------------------------------------------------
// Include socket library
// --------------------------------------------------------------------

#include <socket-library-mt4-mt5.mqh>


// --------------------------------------------------------------------
// EA user inputs
// --------------------------------------------------------------------
//input Channel_Sender 
input ushort   SenderID = 27001;



string   Hostname = "localhost";    // Server hostname or IP address
ushort   ServerPort = 2700;        // Server port

int dig =5;
// --------------------------------------------------------------------
// Global variables and constants
// --------------------------------------------------------------------

ClientSocket * glbClientSocket = NULL;

// --------------------------------------------------------------------
// Initialisation (no action required)
// --------------------------------------------------------------------

void OnInit() {
                  ServerPort = SenderID ;
                  dig = int (SymbolInfoInteger(Symbol(),SYMBOL_DIGITS)  );
                  }


// --------------------------------------------------------------------
// Termination - free the client socket, if created
// --------------------------------------------------------------------

void OnDeinit(const int reason)
{     
      if (glbClientSocket) {  delete glbClientSocket;   glbClientSocket = NULL;   }
}


// --------------------------------------------------------------------
// Tick handling - set up a connection, if none already active,
// and send the current price quote
// --------------------------------------------------------------------
double ask,bid;
void OnTick()
{  
    ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
    bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   //Tick handling - set up a connection, if none already active,
   // and send the current price quote
    sendOnTikit();
  
}

























































//********************************************************************************************
// Client Sideeeeeeeeeeeeeeeee



void sendOnTikit(){
       if (!glbClientSocket) {
      glbClientSocket = new ClientSocket(Hostname, ServerPort);
      if (glbClientSocket.IsSocketConnected()) {
         Print("Client connection succeeded");
      } else {  
      Print("Client connection failed");
       }
      
      
  }

   if (glbClientSocket.IsSocketConnected()) {
      // Send the current price as a CRLF-terminated message
      string strMsg = structuringmsg();
      glbClientSocket.Send(strMsg);
      
   } else {
      // Either the connection above failed, or the socket has been closed since an earlier
      // connection. We handle this in the next block of code...
   }
   
   // If the socket is closed, destroy it, and attempt a new connection
   // on the next call to OnTick()
   if (!glbClientSocket.IsSocketConnected()) {
      // Destroy the server socket. A new connection
      // will be attempted on the next tick
      Print("Client disconnected. Will retry.");
      delete glbClientSocket;
      glbClientSocket = NULL;
   }
}

         // structuringmsg Fix Haidra
         // Var 
         string a="@@",useracc=IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)),lavregacc=IntegerToString(AccountInfoInteger(ACCOUNT_LEVERAGE));
         string companyacc=AccountInfoString(ACCOUNT_COMPANY),nameacc=AccountInfoString(ACCOUNT_NAME),serveracc=AccountInfoString(ACCOUNT_SERVER);
         string digits_ = IntegerToString( SymbolInfoInteger(Symbol(),SYMBOL_DIGITS))  ;
         
         int dLotSize =1; //int (MarketInfo(Symbol(), MODE_LOTSIZE))  
         int Spread =3; //int ( MarketInfo(Symbol(), MODE_SPREAD)  );
         string structuringmsg(){
         string msg=a+"1=2.13"+a+              "11="+useracc+"::"+Symbol()+a;
                   msg+="2=-1"+a+"5="+lavregacc+a+"6="+companyacc+a+"7="+nameacc+a+"8="+serveracc+a;
                   msg+="13="+ digits_+a+"14="+IntegerToString(dLotSize)+a ;
                   msg+="16="+Ask_(ask)+a+"17="+Ask_(bid)+a+"19="+IntegerToString(Spread) +a ;
                   //msg=TimeToString( TimeCurrent() ) +":"+IntegerToString(Seconds()) ;
                   //"16="+DoubleToString(ask);
                   
                   //string Trades = getComment(); 
                   
                   //msg += "20="+Trades + a;
                   
                   
          
   return msg;
}



/*
string getComment(){
    string res = "";
    int i=1;
    for(int order_counter = 0; order_counter < OrdersTotal(); order_counter ++)
      {  
         if(OrderSelect(order_counter, SELECT_BY_POS, MODE_TRADES) == true && OrderSymbol() == Symbol())
         {
         
               res +="##x"+IntegerToString(i);
               
               res+= "Order"   + IntegerToString(  OrderTicket() ) ;
               res+= "Time"    + TimeToString( OrderOpenTime() ) + ":"+ IntegerToString( TimeSeconds( OrderOpenTime()) );
               if(OrderType()==0) {res+= "Type"    + "Buy" ;}
               if(OrderType()==1) {res+= "Type"    + "Sell" ;}
               res+= "Size"    + DoubleToString( NormalizeDouble( OrderLots(),2) );
               res+= "Symbol"  + OrderSymbol();
               res+= "Price"   + DoubleToString( OrderOpenPrice() )  ;
               res+= "Profit"  + Profit_(   OrderProfit()   );
               res+= "Comment" + OrderComment();
               res+="#"+IntegerToString(i)+"#";
                
               i++; 
               
               
               
         }

      }
      
   return res ;
}


*/




string Ask_( double ask_ ){
   string aa =DoubleToString(ask_);
   
     aa = StringSubstr(aa, 0 , StringFind(aa,".")+1+dig)    ;
     
     
    /*if(  StringSubstr(aa,StringLen(aa)-1,1)=="." ){
      aa=StringSubstr(aa,0,StringLen(aa));
     }  */
               
     
     Print(aa);
     Print(dig);
   
   return aa;

}











string Profit_( double Profit_ ){
   string aa =DoubleToString(Profit_);
 
   aa = StringSubstr(aa, 0 , StringFind(aa,".")+1+2)    ;
      
      
   
   return aa;

}


































































void c( string str ){
   
   Print(str);

}