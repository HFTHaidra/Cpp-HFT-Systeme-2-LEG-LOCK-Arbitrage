//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Reference/Script.cpp"
#include "Lockd.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TF3 *F3;

bool isProgrameNotStopd = 1;

//---------------------------------------------------------------------------
__fastcall TF3::TF3(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TF3::Timer2Timer(TObject *Sender)
{
	FastList->Items->Clear();
	SlowList1->Items->Clear();
	SlowList2->Items->Clear();
	for(int i=0;i<getiSym();i++){

		FastList->Items->Add(getId(i));
		SlowList1->Items->Add(getId(i));
        SlowList2->Items->Add(getId(i));



	}
}
//---------------------------------------------------------------------------

void __fastcall TF3::FastListEnter(TObject *Sender)
{
	Timer2->Enabled = 1;
	Timer1->Enabled = 1;


}
//---------------------------------------------------------------------------

void __fastcall TF3::Chart1MouseEnter(TObject *Sender)
{
	GroupBox8->Left     = 760;
	GroupBox8->Height   = 26;
	GroupBox8->Top      = 481;
	GroupBox8->Width    = 54;
}
//---------------------------------------------------------------------------

void __fastcall TF3::Panel1MouseEnter(TObject *Sender)
{
	GroupBox8->Left     = 0;
	GroupBox8->Height   = 250;
	GroupBox8->Top      = 256;
	GroupBox8->Width    = 814;

}
//---------------------------------------------------------------------------

int  N=0,iGap=0, Gap = 0,oGap, TimeOpen = 0,iTime = 0,iTimeRun = 0;
String Id1,Id2,Id3;
double oAsk1 = 0 ,oAsk2=0, Profit1, Profit2 , CurrentProfit = 0;
int iMov =0;
String LotZise ="1",Comment1="amine" ,Comment2="amine" ;
int TimeGlobal = 0, CurrentTime=0, TimeToStop=0;
int iTimeEachAction = 0;

void __fastcall TF3::Timer1Timer(TObject *Sender)
{

   CurrentTime = getTickV12( getTime() );
   Label21->Caption =  IntToStr(CurrentTime-TimeGlobal) ;
   label90->Caption = IntToStr(TimeToStop);


	// Timer 1
	Id1 = FastList->Text;
	Id2 = SlowList1->Text;
	Id3 = SlowList2->Text;
	String ID ="NULL";
	LotZise = IntToStr( StrToInt(Edit11->Text) ) + "."+ Edit12->Text ;
	Comment1 =  Edit13->Text ;
	Comment2 =  Edit4->Text ;
     if( Button3->Caption=="Run...!"  &&  (CurrentTime-TimeGlobal)> TimeToStop  ) {

			C1->Socket->SendText( CloseOrder( Id2,"7",LotZise, Comment1 ) );
			C2->Socket->SendText( CloseOrder( Id3,"7",LotZise, Comment2 ) );
            isProgrameNotStopd = 0;
   }



	if( isId( Id1 ) && isId( Id2 )&& isId( Id3 ) && isProgrameNotStopd ) {
		int Digits1 = StrToInt( getDigitsById(Id1)  );
		int Digits2 = StrToInt( getDigitsById(Id2)  );
		int Digits3 = StrToInt( getDigitsById(Id3)  );

		double Ask1  = Prix( getAskById(Id1) ,Digits1)  ;
		int    Date1 = getTickV12(   getDataById(Id1) ) ;

		double Ask2  = Prix( getAskById(Id2) ,Digits2)  ;
		int    Date2 = getTickV12(   getDataById(Id2) ) ;

		double Ask3  = Prix( getAskById(Id3) ,Digits3)  ;
		int    Date3 = getTickV12(   getDataById(Id3) ) ;

		if(oAsk1==0 || oAsk1==0){
			oAsk1 = Ask1;
			oAsk2 = Ask2;
		}else{//Fin if(oAsk1==0 || oAsk1==0)


				bool Yes =0;
				String PriceMoving = ""; // ==2 Ask1 is Mov == 4 Ask2 Mov
				double Mov_Ask1 = 0;
				double Mov_Ask2 = 0;

				 if(oAsk1!=Ask1){
					 Yes=1;
					 Mov_Ask1 =  (oAsk1 - Ask1)*100;
					 iMov++;
					 oAsk1=Ask1 ;
					 iTime = Date1;
					 if(iTimeRun>0) iTimeRun++;
					 PriceMoving+="Ask1";

				 }

				 if(oAsk2!=Ask2){
					 Yes=1;
					 Mov_Ask2 =  (oAsk2-Ask2)*100;
                     iMov++;
					 oAsk2=Ask2 ;
					 iTime = Date2;
					 if(iTimeRun>0) iTimeRun++;
					 PriceMoving+="Ask2";

				 }

				 if(Yes){

					int MaxDidits = -1;
					if( (Digits1!=-1) && (Digits2!=-1) ){MaxDidits=Digits1; if(Digits2>Digits1) { MaxDidits=Digits2; }   }
					if(Digits3>MaxDidits){ MaxDidits = Digits3; }

					Label1->Caption = " - - - - : " +  sym[getIndexFromId(Id1)].Info.Company ;
					Label8->Caption = " ------- : " +  sym[getIndexFromId(Id2)].Info.Company  ;
					Series1->AddXY(Date1,Ask1);
					Series2->AddXY(Date2,Ask2);
					//******************************
					Series3->AddXY(iMov,Mov_Ask1);
					Series4->AddXY(iMov,Mov_Ask2);

						if(N> StrToInt(Edit1->Text)  ){ Series1->Delete(0); 	Series2->Delete(0); Series3->Delete(0); Series4->Delete(0);}
						N++;
					// Run Locking Arbitrage_ 2 Leg Lock Hidden Forex Trading Software

					if(Button3->Caption!="Strat" && CheckBox2->Checked==0 && CheckBox5->Checked==0 ){
							C1->Socket->SendText( OpenOrder ( Id2 ,"1",LotZise, Comment1 ) );
							C2->Socket->SendText( OpenOrder ( Id3 ,"0",LotZise, Comment2 ) );
							CheckBox2->Checked=1  ;
							CheckBox5->Checked=1  ;
							iTimeEachAction =  iTime ;

					}

					Profit1 = getFerstProfitByID(Id2);
					Profit2 = getFerstProfitByID(Id3);
					Label40->Caption = Profit1;
					Label28->Caption = Profit2;
					Label30->Caption = (iTime-iTimeEachAction) ;

					if(Button3->Caption!="Strat" && Hunting->Checked==1 && CheckBox2->Checked==1 && CheckBox5->Checked==1 && ( (iTime-iTimeEachAction) > StrToInt( Edit17->Text) )  ){

						if( PriceMoving=="Ask1" && Mov_Ask1 > StrToInt(Edit2->Text)  ){ //Max Is Active

										//C1->Socket->SendText( OpenOrder ( ID ,"1",LotZise, Comment ) );
										//Sending Sell = Close Buy For 3ms And Open it  Egan
										C2->Socket->SendText( CloseOrder( Id3,"7",LotZise, Comment2 ) );
										CheckBox5->Checked=0;
										LS->Caption="2";
										iTimeEachAction = iTime;
										Hunting->Checked  = 0;
										Catching->Checked = 1;
										CurrentProfit = getFerstProfitByID(Id2);
										iTimeRun++;
										//c("-------------------");
										//c(CurrentProfit);
										//c("-------------------");


					   }
					   //******************************************************************* Min
						if( PriceMoving=="Ask1" && Mov_Ask1 < StrToInt(Edit7->Text)  ){ //Min Is Active

										//C1->Socket->SendText( OpenOrder ( ID ,"1",LotZise, Comment ) );
										//Sending Buy = Close Sell For 3ms And Open it  Egan
										C1->Socket->SendText( CloseOrder( Id2,"7",LotZise, Comment1 ) );
										CheckBox2->Checked=0;
										LS->Caption="8";
										iTimeEachAction = iTime;
										Hunting->Checked  = 0;
										Catching->Checked = 1;
										CurrentProfit = getFerstProfitByID(Id3);
                                        iTimeRun++;
										//c("-------------------");
									   //c(CurrentProfit);
										//c("-------------------");

					   }





					}else { // fin Hunting->Checked==1

								 if( LS->Caption=="2" || LS->Caption=="8" || LabelState->Caption=="App Stop...!" ){


										double ProfitNow =    0 ;

										if(LS->Caption=="2"){//CheckBox5->Checked=0;
										   ProfitNow =    (getFerstProfitByID(Id2) -  CurrentProfit) ;
										   Label12->Caption = ProfitNow ;
										   //c("Checked=2 Old  : ");c(CurrentProfit);
										   //c(" New : ");c(getFerstProfitByID(Id2));
										}

										if(LS->Caption=="8"){//CheckBox5->Checked=0;
										   ProfitNow =    (getFerstProfitByID(Id3) -  CurrentProfit) ;
										   Label12->Caption = ProfitNow ;
											//c("Checked=8 Old  : ");c(CurrentProfit);
										   //c(" New : ");c(getFerstProfitByID(Id3));

										}
										Label14->Caption = iTimeRun ;
										Label10->Caption = (iTime-iTimeEachAction) ;

													   /*	if( Profit > ( Edit6->Text/10 ) ){

																	C1->Socket->SendText( CloseOrder( ID,"7",LotZise, Comment ) );
																	LS->Caption="-1";
																	TimeOpen = 0;
																	iTimeRun = 0;
																	Hunting->Checked  = 1;
																	Catching->Checked = 0;
																	iTimeEachAction = iTime;
														}      */


														if(( ProfitNow > ( Edit6->Text/10 )) || (iTime-iTimeEachAction)> StrToInt(Edit14->Text) || iTimeRun > StrToInt(Edit5->Text) ){// TimeOut
																	if(LS->Caption=="2"){//
																			//C1->Socket->SendText( CloseOrder( ID,"7",LotZise, Comment1) );
																			C2->Socket->SendText( OpenOrder ( Id3 ,"0",LotZise, Comment2 ) );
																			CheckBox5->Checked=1;
																	}

																	if(LS->Caption=="8"){//
																			C1->Socket->SendText( OpenOrder ( Id2 ,"1",LotZise, Comment1 ) );
																			CheckBox2->Checked=1;
																	}

																	LS->Caption="-1";
																	TimeOpen = 0;
																	iTimeRun = 0;
																	Hunting->Checked  = 1;
																	Catching->Checked = 0;
																	iTimeEachAction = iTime;
																	CurrentProfit = 0;
														}

														if(LS->Caption=="App Stop...!" ){
														   C1->Socket->SendText( CloseOrder( Id2,"7",LotZise, Comment1 ) );
														   C2->Socket->SendText( CloseOrder( Id3,"7",LotZise, Comment2 ) );

														}

								 }// Fin if if( LabelState->Caption=="2" || LabelState->Caption=="App Stop...!" )



							}// fin else Hunting->Checked==1




				 }//Fin if(Yes)

		} //Fin Esle Of if(oAsk1==0 || oAsk1==0)

	}

}
//---------------------------------------------------------------------------

void __fastcall TF3::Button4Click(TObject *Sender)
{
	LotZise = IntToStr( StrToInt(Edit11->Text) ) + "."+ Edit12->Text ;
	Comment1 =  Edit13->Text ;
	Comment2 =  Edit4->Text ;
	C1->Socket->SendText( CloseOrder( Id2,"7",LotZise, Comment1) );
	C2->Socket->SendText( CloseOrder( Id3,"7",LotZise, Comment2) );
}
//---------------------------------------------------------------------------


void __fastcall TF3::Portc1Change(TObject *Sender)
{
	C1->Active = 0;
	C1->Port   = StrToInt(  Portc1->Text );
	C1->Active = 1;
}
//---------------------------------------------------------------------------

void __fastcall TF3::Portc2Change(TObject *Sender)
{
	C2->Active = 0;
	C2->Port   = StrToInt(  Portc2->Text );
	C2->Active = 1;
}
//---------------------------------------------------------------------------

void __fastcall TF3::Button2Click(TObject *Sender)
{       C1->Active=false;
		C2->Active=false;
		C1->Active = 1;
        C2->Active = 1;
		C1->Socket->SendText("Tasting Connection");
        C2->Socket->SendText("Tasting Connection");
}
//---------------------------------------------------------------------------

void __fastcall TF3::Button3Click(TObject *Sender)
{
	//iTimeEachAction = getTickV12(   getTime() ) ;
	if(Button3->Caption=="Strat"){
		C1->Active = 1;
		C2->Active = 1;
		C1->Socket->SendText("Tasting Connection");
		C2->Socket->SendText("Tasting Connection");

		   Button3->Caption="Run...!"  ;
		   TimeGlobal = getTickV12( getTime() );
		   //15-10-2020 8:37:18:868
		   TimeToStop = getTickV12("15-10-2020 "+Edit8->Text+":"+Edit9->Text+":"+Edit10->Text+":001");
	}else{
		  Button3->Caption="Strat" ;
	}
}
//---------------------------------------------------------------------------

void __fastcall TF3::C1Read(TObject *Sender, TCustomWinSocket *Socket)
{
    setMsgClient1(  Socket->ReceiveText()  );
}
//---------------------------------------------------------------------------

void __fastcall TF3::C2Read(TObject *Sender, TCustomWinSocket *Socket)
{
		setMsgClient2(  Socket->ReceiveText()  );
}
//---------------------------------------------------------------------------

