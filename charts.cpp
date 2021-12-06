//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Reference/Script.cpp"
#include "charts.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TF2 *F2;
//---------------------------------------------------------------------------
bool isProgrameNotStopd = 1;
bool AutoTrade = 0;

__fastcall TF2::TF2(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
int x =1 , y =2, N=0,iGap=0, Gap = 0,oGap, TimeOpen = 0,iTime = 0,iTimeRun = 0;
String Id1,Id2;
double oAsk1 = 0 ,oAsk2=0;
int iMov =0;
String LotZise ="1",Comment="amine" ;
int TimeToStart = 0, CurrentTime=0, TimeToStop=0;
void __fastcall TF2::Timer1Timer(TObject *Sender)
{
   if(AutoTrade==0){
		if(CurrentTime>=TimeToStop) {
			Button2->Click();

		}

   }else{

		if(CurrentTime>=TimeToStart && (CurrentTime<TimeToStop) && Button3->Enabled==1) {
			Button3->Click();
		}

		if(CurrentTime>=TimeToStop && Button2->Enabled==1 ) {
			Button2->Click();
		}
   }

	if( (iSym>=2) && (sym[0].AskCurrent.Length()>3) && (sym[1].AskCurrent.Length()>3 && isId( R22_list1->Text ) && isId( R22_list2->Text )) ) { // Data Is Feeded

		Id1 = R22_list1->Text;
		Id2 = R22_list2->Text;

		//** Timing

		String Hours = sym[ getIndexFromId(Id2) ].HoursCurrent;
			   Hours = Hours.SubString(2,Hours.Length()-2);
			  Label15->Caption = Hours ;
			  CurrentTime =  getMini(" "+Hours);
			  Label28->Caption = CurrentTime ;

		int Digits1 = StrToInt( getDigitsById(Id1)  );
		int Digits2 = StrToInt( getDigitsById(Id2)  );



		double Ask1  = Prix( getAskById(Id1) ,Digits1)  ;
		double Bid1  = Prix( getBidById(Id1),Digits1)  ;
		int    Date1 = getTickV12(   getDataById(Id1) ) ;


		double Ask2  = Prix( getAskById(Id2) ,Digits2)  ;
		double Bid2  = Prix( getBidById(Id2),Digits2)  ;
		int    Date2 = getTickV12(   getDataById(Id2) ) ;




		if(oAsk1==0 || oAsk1==0){
			oAsk1 = Ask1;
			oAsk2 = Ask2;
		}else{
				bool Yes =0;
				String PriceMoving = ""; // ==2 Ask1 is Mov == 4 Ask2 Mov
				 double Mov_Ask1_Lavel1 = 0,Mov_Ask2_Lavel1 = 0;

                 double Key = 0;

				if(oAsk1!=Ask1){
					 Yes=1;
					 Mov_Ask1_Lavel1 =  (oAsk1 - Ask1)*100;
					 iMov++;
					 oAsk1=Ask1 ;
					 iTime = Date1;
					 if(iTimeRun>0) iTimeRun++;
					 PriceMoving+="Ask1";

				 }
				if(oAsk2!=Ask2){
					 Yes=1;
					 Mov_Ask2_Lavel1 =  (oAsk2-Ask2)*100;
                     iMov++;
					 oAsk2=Ask2 ;
					 iTime = Date2;
					 if(iTimeRun>0) iTimeRun++;
					 PriceMoving+="Ask2";

				 }



				if(Yes){

					int MaxDidits = -1;
					if( (Digits1!=-1) && (Digits2!=-1) ){MaxDidits=Digits1; if(Digits2>Digits1) { MaxDidits=Digits2; }   }

					Label1->Caption = " - - - - : " +  sym[getIndexFromId(Id1)].Info.Company ;
					Label8->Caption = " ------- : " +  sym[getIndexFromId(Id2)].Info.Company  ;
					x++;
					Series1->AddXY(Date1,Ask1);
					Series2->AddXY(Date2,Ask2);








					//******************************
					Gap = int ( RoundSpread(Ask1 - Ask2,MaxDidits) ) ;
					Gap = Gap - StrToInt( Edit4->Text );
					Series4->AddXY(iGap,Gap);


					 Series6->AddXY(iMov,Mov_Ask1_Lavel1);
					 Series7->AddXY(iMov,Mov_Ask2_Lavel1);

					iGap++;













						if(N> StrToInt(Edit1->Text)  ){
							Series1->Delete(0);
							Series2->Delete(0);
							Series4->Delete(0);
							Series6->Delete(0);
							Series7->Delete(0);

						}
						N++;

				   //**********************************************************
				   //**********************************************************
				   //**********************************************************
				   // Run Testing
				   String ID ="NULL";
				   if(Hunting->Checked==1 && LabelState->Caption=="-1" && isProgrameNotStopd ){

					   LotZise = IntToStr( StrToInt(Edit11->Text) ) + "."+ Edit12->Text ;
					   Comment =  Edit13->Text ;
						ID = Id2;
					   if( PriceMoving=="Ask1" && Mov_Ask1_Lavel1 > StrToInt(Edit2->Text)  ){ //Max Is Active



										C1->Socket->SendText( OpenOrder ( ID ,"1",LotZise, Comment ) );
										LabelState->Caption="2";
										TimeOpen = iTime;
										iTimeRun = 1;
										Hunting->Checked  = 0;
										Catching->Checked = 1;

					   }

					   //******************************************************************* Min
					   if( PriceMoving=="Ask1"  && Mov_Ask1_Lavel1 < StrToInt(Edit7->Text)  ){ //Max Is Active


										C1->Socket->SendText( OpenOrder ( ID ,"0",LotZise, Comment ) );
										LabelState->Caption="2";
										TimeOpen = iTime;
                                        iTimeRun = 1;
                                        Hunting->Checked  = 0;
										Catching->Checked = 1;

					   }


					}else{
						 if( LabelState->Caption=="2"  ){

							Label10->Caption = (iTime-TimeOpen) ;
							ID = Id2;
							double Profit = getFerstProfitByID(ID);
							Label12->Caption = Profit ;
							Label14->Caption = iTimeRun ;
							LotZise = IntToStr( StrToInt(Edit11->Text) ) + "."+ Edit12->Text ;
							Comment =  Edit13->Text ;

							if( Profit > ( Edit6->Text/10 ) ){

										C1->Socket->SendText( CloseOrder( ID,"7",LotZise, Comment ) );
										LabelState->Caption="-1";
										TimeOpen = 0;
										iTimeRun = 0;
										Hunting->Checked  = 1;
										Catching->Checked = 0;
							}


							if( (iTime-TimeOpen)>= StrToInt(Edit3->Text) || iTimeRun > StrToInt(Edit5->Text) ){// TimeOut

										C1->Socket->SendText( CloseOrder( ID,"7",LotZise, Comment) );
										LabelState->Caption="-1";
										TimeOpen = 0;
                                        iTimeRun = 0;
										Hunting->Checked  = 1;
										Catching->Checked = 0;
							}


						 }





					}

				}


          oGap = Gap ;
		}

   }







}
//---------------------------------------------------------------------------
void __fastcall TF2::CheckBox1Click(TObject *Sender)
{
		if (CheckBox1->Checked == 1){
			CheckBox1->Caption = "OF";
			Timer1->Enabled = 1;
		}else{
			CheckBox1->Caption = "ON" ;
			Timer1->Enabled = 0;
		}
}
//---------------------------------------------------------------------------
void __fastcall TF2::Button1Click(TObject *Sender)
{

	   Series1->Clear();
	   Series2->Clear();
       Series4->Clear();
	   N=0;
}
//---------------------------------------------------------------------------
void __fastcall TF2::Chart1MouseEnter(TObject *Sender)
{
		// 0


		GroupBox1->Width   = 0   ;
		GroupBox1->Height   = 0  ;
		GroupBox1->Top   = 0  ;
		GroupBox1->Left   =  0 ;

		GroupBox8->Width   = 0   ;
		GroupBox8->Height   = 0  ;
		GroupBox8->Top   = 0  ;
		GroupBox8->Left   =  0 ;
}
//---------------------------------------------------------------------------


void __fastcall TF2::Button3Click(TObject *Sender)
{
		TimeToStart =getMini( " "+ComboBox1->Text +":" + ComboBox2->Text  +":00" ) ;
		Label27->Caption = TimeToStart ;
		Label16->Caption = ComboBox1->Text +":" + ComboBox2->Text  +":00";
		TimeToStop =getMini( " "+ComboBox3->Text +":" + ComboBox4->Text  +":00" ) ;
		Label29->Caption = TimeToStop ;
        Label17->Caption = ComboBox3->Text +":" + ComboBox4->Text  +":00";


		isProgrameNotStopd = 1;
		C1->Active=0;
		C1->Port      = StrToInt(  Portc1->Text );
		C1->Active=1;
		C1->Socket->SendText("Tasting Connection");
		//TimeGlobal = getTickV12( getTime() );
		//15-10-2020 8:37:18:868
		//TimeToStop = getTickV12("15-10-2020 "+Edit8->Text+":"+Edit9->Text+":"+Edit10->Text+":001");
		Button3->Enabled=0;
		Button2->Enabled=1;

}
//---------------------------------------------------------------------------


void __fastcall TF2::C1Read(TObject *Sender, TCustomWinSocket *Socket)
{
	setMsgClient1(  Socket->ReceiveText()  );

}
//---------------------------------------------------------------------------

void __fastcall TF2::C2Read(TObject *Sender, TCustomWinSocket *Socket)
{
	setMsgClient1(  Socket->ReceiveText()  );
}
//---------------------------------------------------------------------------


void __fastcall TF2::Timer2Timer(TObject *Sender)
{
	R22_list1->Items->Clear();
	R22_list2->Items->Clear();
	for(int i=0;i<getiSym();i++){

		R22_list1->Items->Add(getId(i));
		R22_list2->Items->Add(getId(i));



	}
}
//---------------------------------------------------------------------------


void __fastcall TF2::Panel1MouseEnter(TObject *Sender)
{
		GroupBox1->Width   = 1096   ;
		GroupBox1->Height   = 257  ;
		GroupBox1->Top   = 116  ;
		GroupBox1->Left   =  1 ;
}
//---------------------------------------------------------------------------


void __fastcall TF2::ssMouseEnter(TObject *Sender)
{
		GroupBox8->Width   = 1096   ;
		GroupBox8->Height   = 257  ;
		GroupBox8->Top   = 116  ;
		GroupBox8->Left   =  1 ;
}
//---------------------------------------------------------------------------

void __fastcall TF2::Button4Click(TObject *Sender)
{
	 if( Button4->Enabled==1 ){
	    TimeToStart =getMini( " "+ComboBox1->Text +":" + ComboBox2->Text  +":00" ) ;
		Label27->Caption = TimeToStart ;
		Label16->Caption = ComboBox1->Text +":" + ComboBox2->Text  +":00";
		TimeToStop =getMini( " "+ComboBox3->Text +":" + ComboBox4->Text  +":00" ) ;
		Label29->Caption = TimeToStop ;
		Label17->Caption = ComboBox3->Text +":" + ComboBox4->Text  +":00";

        AutoTrade = 1;
		Button4->Enabled = 0;
	 }
}
//---------------------------------------------------------------------------


void __fastcall TF2::R22_list1MouseEnter(TObject *Sender)
{
	Timer1->Enabled = 1;
	Timer2->Enabled = 1;
}
//---------------------------------------------------------------------------

void __fastcall TF2::R22_list2MouseEnter(TObject *Sender)
{
    Timer1->Enabled = 1;
	Timer2->Enabled = 1;
}
//---------------------------------------------------------------------------

void __fastcall TF2::Portc1Change(TObject *Sender)
{
	//C1->Active = 0;
	//C1->Port   = StrToInt(  Portc1->Text );
	//C1->Active = 1;
}
//---------------------------------------------------------------------------


void __fastcall TF2::Button2Click(TObject *Sender)
{
	Button3->Enabled=1;
	Button2->Enabled=0;

	isProgrameNotStopd = 0;
	LotZise = IntToStr( StrToInt(Edit11->Text) ) + "."+ Edit12->Text ;
	Comment =  Edit13->Text ;
    Id2     = R22_list2->Text;
	C1->Socket->SendText( CloseOrder( Id2,"7",LotZise, Comment) );
	C1->Active = 0;
	Hunting->Checked = 1;
	Catching->Checked = 0;
	LabelState->Caption = "-1";
	Label12->Caption ="0";
	Label14->Caption ="0";
	Label10->Caption ="0";

}
//---------------------------------------------------------------------------

void __fastcall TF2::ComboBox1Change(TObject *Sender)
{
	TimeToStart =getMini( " "+ComboBox1->Text +":" + ComboBox2->Text  +":00" ) ;
	Label27->Caption = TimeToStart ;
}
//---------------------------------------------------------------------------

void __fastcall TF2::ComboBox2Change(TObject *Sender)
{
	TimeToStart =getMini( " "+ComboBox1->Text +":" + ComboBox2->Text  +":00" ) ;
	Label27->Caption = TimeToStart ;
}
//---------------------------------------------------------------------------

void __fastcall TF2::ComboBox3Change(TObject *Sender)
{
	 TimeToStop =getMini( " "+ComboBox3->Text +":" + ComboBox4->Text  +":00" ) ;
	Label29->Caption = TimeToStop ;
}
//---------------------------------------------------------------------------

void __fastcall TF2::ComboBox4Change(TObject *Sender)
{
	 TimeToStop =getMini( " "+ComboBox3->Text +":" + ComboBox4->Text  +":00" ) ;
	Label29->Caption = TimeToStop ;
}
//---------------------------------------------------------------------------

