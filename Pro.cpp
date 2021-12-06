//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop
#include "Pro.h"
#include "charts.h"
#include "Lockd.h"
#include "Reference/Script.cpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
Tapp *app;
//---------------------------------------------------------------------------
__fastcall Tapp::Tapp(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall Tapp::bStartResivingClick(TObject *Sender)
{
	bStartResiving->Enabled=False;
	server->Active=false;
    GroupBox6->Enabled = 0;
	server->Port = StrToInt( reseverid->Text ) ;
	server->Active=true;
	bStopResiving->Enabled = true;
	reseverid->Enabled=false;
}
//---------------------------------------------------------------------------


void __fastcall Tapp::serverClientConnect(TObject *Sender, TCustomWinSocket *Socket)

{
	setConsoleMSG("Client is Connectd...!\n");
	bConsole->Click();
	setConsoleMSG("NULL");
}
//---------------------------------------------------------------------------


void __fastcall Tapp::serverClientWrite(TObject *Sender, TCustomWinSocket *Socket)

{
	HandleIncomingData(Socket->ReceiveText());
	if (consoleMSG!="NULL"){ bConsole->Click();consoleMSG="NULL";}
}
//---------------------------------------------------------------------------

void __fastcall Tapp::serverClientRead(TObject *Sender, TCustomWinSocket *Socket)

{
	//c("-------> "+getTime());
	HandleIncomingData(Socket->ReceiveText());





	if (consoleMSG!="NULL"){ bConsole->Click();consoleMSG="NULL";}

    //**** test is Allow Fers
	StrategyR22Run->Click();

    //c("===> "+getTime());

}
//---------------------------------------------------------------------------



void __fastcall Tapp::bStopResivingClick(TObject *Sender)
{
	bStartResiving->Enabled=true;
	server->Active=false;
	bStopResiving->Enabled = false;
	reseverid->Enabled=true;
    GroupBox6->Enabled = 1;
}
//---------------------------------------------------------------------------



void __fastcall Tapp::DataTimerTimer(TObject *Sender)
{
		//DataTimerTimer...
		 bRef->Click();
			if(DivMod->Checked == 1){
			   c("Div Mode Is On...!");
			   bStartResiving->Click();
			   bChart->Click();
			   DivMod->Checked = 0;
			}

}
//---------------------------------------------------------------------------

void __fastcall Tapp::bRefClick(TObject *Sender)
{

  symGrid->Cells[0][0]="Id";
  symGrid->Cells[1][0]="Symbol";
  symGrid->Cells[2][0]="Server";
  symGrid->Cells[3][0]="Tickets";
  symGrid->Cells[4][0]="First Date";
  symGrid->Cells[5][0]="Last Date";
  int i=0,tike=0;
  for(;i<getiSym();i++){
	symGrid->Cells[0][i+1]=getId(i);
	symGrid->Cells[1][i+1]=getSymbolFromId(   getId(i)  );
	symGrid->Cells[2][i+1]=getServerInInfo(   i   );
	symGrid->Cells[3][i+1]=IntToStr(getTikets(i))+"/"+MaxData;
	symGrid->Cells[4][i+1]= sym[i].Date[0] ;
	symGrid->Cells[5][i+1]= sym[i].Date[ sym[i].iLast-1 ] ;
	tike+=getTikets(i);
  }
  symGrid->Cells[2][i+1]=" All : ";
  symGrid->Cells[3][i+1]=IntToStr(tike);
  // Stratigy R22 Lists
	i=0;
	R22_list1->Items->Clear();
	R22_list2->Items->Clear();



	for(;i<getiSym();i++){

		R22_list1->Items->Add(getId(i));
		R22_list2->Items->Add(getId(i));


	}



}
//---------------------------------------------------------------------------


void __fastcall Tapp::SaveAllClick(TObject *Sender)

{
   if(ofSaving->Enabled==1) {


		String SavingDir1=getTimeForFile();
		for(int i=0;i<iSym;i++){
		   String fileName= SavingDir1+sym[i].Info.Server+getSymbolFromId(   getId(i)  )+".csv";
		   SavingMemo->Clear();
		   for(int j=0;j<sym[i].iLast;j++){
			 SavingMemo->Lines->Add( sym[i].Date[j]+" ; "+sym[i].Ask[j]+" ; "+sym[i].Bid[j] );
		   }


		   SavingMemo->Lines->SaveToFile(fileName);
		}

		//SavingMemo->Lines->SaveToFile(SavingDir1);
   }

}
//---------------------------------------------------------------------------

void __fastcall Tapp::DataSaveTimerTimer(TObject *Sender)
{
        SaveAll->Click();
}
//---------------------------------------------------------------------------





void __fastcall Tapp::ofSavingClick(TObject *Sender)
{
	onSaving->Enabled = true;
	ofSaving->Enabled = false;
	setisSavingDataActive(0);
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Strategy_ONClick(TObject *Sender)
{
	  Strategy_OF->Enabled = true;
	 Strategy_ON->Enabled = false;
	 StrategyR22Active->Checked = true;

	C1->Active=false;
	C1->Port = StrToInt(Portc1->Text);
	C1->Active=true;
	C2->Active=false;
	C2->Port = StrToInt(Portc2->Text);
	C2->Active=true;
	C1->Socket->SendText("Tasting Connection");
	C2->Socket->SendText("Tasting Connection");
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Strategy_OFClick(TObject *Sender)
{
	 Strategy_ON->Enabled = true;
	 Strategy_OF->Enabled = false;
	 StrategyR22Active->Checked = false;
     // Run For Stop trading if Trade is open
}
//---------------------------------------------------------------------------

void __fastcall Tapp::onSavingClick(TObject *Sender)
{
	ofSaving->Enabled = true;
	onSaving->Enabled = false;
	setisSavingDataActive(1);
}
//---------------------------------------------------------------------------



//-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-



void __fastcall Tapp::StrategyR22RunClick(TObject *Sender)
{

	 String Id1 = "NULL",Id2 = "NULL";
	 double Ask1 = 0, Ask2 = 0, Bid1 = 0, Bid2 = 0, Spread1 = 6000, Spread2 = 6000;
	 int Digits1 = -1, Digits2 =-1,MaxDidits=-1;
	//~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@
	if( isId( R22_list1->Text )  ){
		//****
	   Id1 = R22_list1->Text;
	   if(getIndexFromId(Id1)!=-1){
		   Digits1                  = StrToInt( getDigitsById(Id1)  );
		   //c("<====="+getAskById(Id1));
		   Ask1      				= Prix(  getAskById(Id1) , Digits1 );
		   Bid1 					= Prix(  getBidById(Id1) , Digits1 );
		   Spread1					= RoundSpread(Ask1 - Bid1,Digits1);
		   R22Date1->Caption 		= getDataById(Id1);
		   R22Ask1->Caption 		= Ask1;
		   R22Bid1->Caption 		= Bid1;
		   R22Digits1->Caption 		= Digits1;
		   R22Spread1->Caption 		= Spread1;
	   }

	}
	//~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@~@
	if( isId( R22_list2->Text) ){
		//****
		Id2 = R22_list2->Text;
	   if(getIndexFromId(Id2)!=-1){
		   Digits2                  = getDigitsById(Id2);
		   Ask2      				= Prix(  getAskById(Id2) , Digits2  );
		   Bid2 					= Prix(  getBidById(Id2) , Digits2 );
		   Spread2					= RoundSpread(Ask2 - Bid2,Digits2);
		   R22Date2->Caption 		= getDataById(Id2);
		   R22Ask2->Caption 		= Ask2;
		   R22Bid2->Caption 		= Bid2;
		   R22Digits2->Caption 		= Digits2;
		   R22Spread2->Caption 		= Spread2;

	   }
	}

			//  Remplir Pannel 3
			int AllSpread , MaxDif,MinDif, AskDif ;
			String Trade1,Trade2;
			if( (Digits1!=-1) && (Digits2!=-1) ){MaxDidits=Digits1; if(Digits2>Digits1) { MaxDidits=Digits2; }   }
			if(MaxDidits!=-1){
				AllSpread =RoundSpread(Ask2 - Bid2,MaxDidits)+RoundSpread(Ask1 - Bid1,MaxDidits) ;
				AskDif = int ( RoundSpread(Ask1 - Ask2,MaxDidits) ) ;
				MaxDif = MaxInt_(  StrToInt(R22_MaxDif->Caption)  , AskDif );
				MinDif = MinInt_(  StrToInt(R22_MinDif->Caption)  , AskDif );
				R22_AllSpread->Caption =AllSpread;
				R22_AskDif->Caption = AskDif;
				R22_MaxDif->Caption =MaxDif;
                R22_MinDif->Caption =MinDif;

			}


			// Remplir Plan 5

			FastTrade->Cells[1][0]=" Fast Trades ___ Time"; FastTrade->Cells[2][0]="Type";FastTrade->Cells[3][0]="Size";FastTrade->Cells[4][0]="Symbol";FastTrade->Cells[5][0]="Price";FastTrade->Cells[6][0]="Profit";FastTrade->Cells[7][0]="Comment";
			SlowTrade->Cells[1][0]=" Slow Trades ___ Time"; SlowTrade->Cells[2][0]="Type";SlowTrade->Cells[3][0]="Size";SlowTrade->Cells[4][0]="Symbol";SlowTrade->Cells[5][0]="Price";SlowTrade->Cells[6][0]="Profit";SlowTrade->Cells[7][0]="Comment";

			double AllProfit1 = 0 , AllProfit2 = 0;

			if(Id1!="NULL"){

				String Orders = "11"+getOrdersById(Id1);
				String X = "##x";
				int    iX =1 ;
				int Long =0;
				bool b=true;
				for(;b;){
					String u = X+iX,y="#"+IntToStr(iX)+"#";
					double profit = 0;
					if ( Orders.Pos(u)!=0 ){
						String Line = Orders.SubString( Orders.Pos(u)   ,  Orders.Pos(y) - Orders.Pos(u) );
						FastTrade->Cells[0][iX] = iX;
						FastTrade->Cells[1][iX] = Line.SubString( Line.Pos("Time")+4 , Line.Pos("Type") - Line.Pos("Time")-4  );
						FastTrade->Cells[2][iX] = Line.SubString( Line.Pos("Type")+4 , Line.Pos("Size") - Line.Pos("Type")-4  );
						FastTrade->Cells[3][iX] =   Line.SubString( Line.Pos("Size")+4 , Line.Pos("Symbol") - Line.Pos("Size")-4    );
						FastTrade->Cells[4][iX] = Line.SubString( Line.Pos("Symbol")+6 , Line.Pos("Price") - Line.Pos("Symbol")-6  );
						FastTrade->Cells[5][iX] =    Line.SubString( Line.Pos("Price")+5 , Line.Pos("Profit") - Line.Pos("Price")-5  );
						profit = Prix(   Line.SubString( Line.Pos("Profit")+6 , Line.Pos("Comment") - Line.Pos("Profit")-6  )  , 2);
						FastTrade->Cells[6][iX] =profit;
						AllProfit1+=profit;
						FastTrade->Cells[7][iX] = Line.SubString( Line.Pos("Comment")+7 , Line.Length() - Line.Pos("Comment")-6  );
						Line=Line+"____"+iX;
						//console->Lines->Add(Line);
					}else{b=false;FastTrade->RowCount=iX;}
					iX++;
					Long= Long + Orders.Pos(u);
				}
			}

			FastTrade->Cells[1][0]="  AllProfit = "+FloatToStr(AllProfit1)+" $";

			if(Id2!="NULL"){

				String Orders = "11"+getOrdersById(Id2);
				String X = "##x";
				int    iX =1 ;
				int Long =0;
				bool b=true;
				for(;b;){
					String u = X+iX,y="#"+IntToStr(iX)+"#";
					double profit;
					if ( Orders.Pos(u)!=0 ){
						String Line = Orders.SubString( Orders.Pos(u)   ,  Orders.Pos(y) - Orders.Pos(u) );
						SlowTrade->Cells[0][iX] = iX;
						SlowTrade->Cells[1][iX] = Line.SubString( Line.Pos("Time")+4 , Line.Pos("Type") - Line.Pos("Time")-4  );
						SlowTrade->Cells[2][iX] = Line.SubString( Line.Pos("Type")+4 , Line.Pos("Size") - Line.Pos("Type")-4  );
						SlowTrade->Cells[3][iX] =  Line.SubString( Line.Pos("Size")+4 , Line.Pos("Symbol") - Line.Pos("Size")-4  );
						SlowTrade->Cells[4][iX] = Line.SubString( Line.Pos("Symbol")+6 , Line.Pos("Price") - Line.Pos("Symbol")-6  );
						SlowTrade->Cells[5][iX] =    Line.SubString( Line.Pos("Price")+5 , Line.Pos("Profit") - Line.Pos("Price")-5  );
						profit = Prix(   Line.SubString( Line.Pos("Profit")+6 , Line.Pos("Comment") - Line.Pos("Profit")-6  )  , 2);
						SlowTrade->Cells[6][iX]=profit;
						AllProfit2 += profit;
						SlowTrade->Cells[7][iX] = Line.SubString( Line.Pos("Comment")+7 , Line.Length() - Line.Pos("Comment")-6  );
						Line=Line+"____"+iX;
						//console->Lines->Add(Line);
					}else{b=false;SlowTrade->RowCount=iX;}
					iX++;
					Long= Long + Orders.Pos(u);
				}
			}

			SlowTrade->Cells[1][0]=" AllProfit = "+FloatToStr(AllProfit2)+" $";




					// Run Stratigy
					if(StrategyR22Active->Checked == 1 ){
						//**
						if(Hunting->Checked){
						 //**
						  if(getR22_state()==4){
								if( msgClient1.SubString(0,3)=="Clo" && msgClient2.SubString(0,3)=="Clo" ){
									setR22_state(-1);
									LabelState->Caption = "-1";
									msgClient1 = "NULL";
									msgClient2 = "NULL";
								}
						  }else{


									if( getR22_state()==-1 && StrToInt(R22_AllSpread->Caption) <= StrToInt(MyMaxSpread->Text) && StrToInt(R22_AskDif->Caption) > StrToInt(MyMaxDif->Text) ){
										//**
										if(getR22_state()==-1  ){
                                             c("---> Open Order Ask1="+R22Ask1->Caption+" Ask2="+R22Ask2->Caption+" (SP1,SP2)=("+R22Spread1->Caption+";"+R22Spread2->Caption+")"    );
											 C1->Socket->SendText( OpenOrder( R22_list1->Text,"1",FastSize->Text, Code1->Text+"_"+Code2->Text ) );
											 C2->Socket->SendText( OpenOrder( R22_list2->Text,"0",SlowSize->Text, Code1->Text+"_"+Code2->Text ) );

											 Catching->Checked = 1;
											 Hunting->Checked  = 0;
											 setR22_state(0);
											 LabelState->Caption = "0";
										 }

									}
								}
						}else{
						//**
							if(getR22_state()==0){
								// C1 send SELL && C2 send BUY
								if( msgClient1.SubString(0,3)=="SEL" && msgClient2.SubString(0,3)=="BUY" ){
									setR22_state(2);
									LabelState->Caption = "2";
									msgClient1 = "NULL";
									msgClient2 = "NULL";
								}

							}else{
                                // tasting For Closeing
										if(getR22_state()==2 &&  StrToInt(R22_AllSpread->Caption) <= StrToInt(MyMaxSpread->Text) && StrToInt(R22_AskDif->Caption) < StrToInt(MyMinDif->Text) ){
										//**

											 C1->Socket->SendText( CloseOrder( R22_list1->Text,"7",FastSize->Text, Code1->Text+"_"+Code2->Text ) );
											 C2->Socket->SendText( CloseOrder( R22_list2->Text,"7",SlowSize->Text, Code1->Text+"_"+Code2->Text ) );



										 Catching->Checked = 0;
										 Hunting->Checked  = 1;
										 Code2->Text = StrToInt(Code2->Text) +1;
										 setR22_state(4);
										 LabelState->Caption = "4";

									 }


							}


						}

					}else{
						//***
					}



}
//---------------------------------------------------------------------------








void __fastcall Tapp::R22ClearClick(TObject *Sender)
{
	R22_MaxDif->Caption ="-6000";
	R22_MinDif->Caption ="6000";
}
//---------------------------------------------------------------------------


void __fastcall Tapp::Button4Click(TObject *Sender)
{
	//C1->Active=true;
	C2->Socket->SendText( OpenOrder( "70564456::#USNDAQ100","1","1", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button10Click(TObject *Sender)
{
	C1->Active=false;
	C1->Port = 27401;
	C1->Active=true;
	C2->Active=false;
	C2->Port = 27501;
	C2->Active=true;
	C1->Socket->SendText("Tasting Connection");
	C2->Socket->SendText("Tasting Connection");
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button5Click(TObject *Sender)
{
		C1->Socket->SendText( OpenOrder( "23956154::BCHUSD","1","1", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button6Click(TObject *Sender)
{
			C1->Socket->SendText("-5-5-5-5");
			C2->Socket->SendText("56666555");
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button11Click(TObject *Sender)
{
			C1->Socket->SendText( OpenOrder( "23956154::BCHUSD","0","0.01", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button12Click(TObject *Sender)
{
			C2->Socket->SendText( OpenOrder( "70564456::#USNDAQ100","0","1", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button8Click(TObject *Sender)
{
		C1->Socket->SendText( CloseOrder( "23956154::BCHUSD","7","1", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::Button7Click(TObject *Sender)
{
		C2->Socket->SendText( CloseOrder( "70564456::#USNDAQ100","7","1", Edit10->Text+"_"+Edit11->Text ) );
}
//---------------------------------------------------------------------------

void __fastcall Tapp::C1Read(TObject *Sender, TCustomWinSocket *Socket)
{
	setMsgClient1(  Socket->ReceiveText()  );

}
//---------------------------------------------------------------------------

void __fastcall Tapp::C2Read(TObject *Sender, TCustomWinSocket *Socket)
{
	setMsgClient2(  Socket->ReceiveText()  );

}
//---------------------------------------------------------------------------



void __fastcall Tapp::TestSpeedClick(TObject *Sender)
{
	int N = StrToInt(TTT22->Text);
    sddsd->Text = getTime();
	String s = "sdfvfkldqslqdlgk1dflmkqgpqdfjkl5gkqdflmjkgmqldfsk5gsdfvfkldqslqdlgk1dflmkqgpqdfjkl5gkqdflmjkgmqldfsk5gsdf99fkldqslqdlgk1dflmkqgpqdfjkl5gkqdflmjkgm88dfsk5g";
	  for(int i =0;i<(N*100); i++){
		String l = Testy(s);
        //c(l);
	  }
      qsd98->Text = getTime();
}
//---------------------------------------------------------------------------







void __fastcall Tapp::bChartClick(TObject *Sender)
{
		F2->Show();
}
//---------------------------------------------------------------------------


void __fastcall Tapp::DivModClick(TObject *Sender)
{
	if(DivMod->Checked == 1){

	   bStartResiving->Click();
	   bChart->Click();
	}
}
//---------------------------------------------------------------------------





void __fastcall Tapp::Button13Click(TObject *Sender)
{
		F3->Show();
}
//---------------------------------------------------------------------------

