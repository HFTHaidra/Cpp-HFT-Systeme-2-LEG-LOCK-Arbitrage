//---------------------------------------------------------------------------

#ifndef ProH
#define ProH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <System.Win.ScktComp.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBGrids.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
//---------------------------------------------------------------------------
class Tapp : public TForm
{
__published:	// Composants gérés par l'EDI
	TPanel *Panel1;
	TPanel *Panel2;
	TButton *bStartResiving;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TTabSheet *TabSheet2;
	TPanel *Panel3;
	TButton *bConsole;
	TServerSocket *server;
	TButton *bStopResiving;
	TPageControl *PageControl2;
	TTabSheet *TabSheet5;
	TTimer *DataTimer;
	TButton *bRef;
	TStringGrid *symGrid;
	TButton *SaveAll;
	TTimer *DataSaveTimer;
	TTabSheet *TabSheet6;
	TMemo *SavingMemo;
	TPanel *Panel5;
	TLabel *Label3;
	TPanel *Panel6;
	TComboBox *R22_list1;
	TPanel *Panel7;
	TLabel *Label4;
	TComboBox *R22_list2;
	TPanel *Panel8;
	TPanel *Panel10;
	TPanel *Panel12;
	TLabel *Label5;
	TLabel *R22Ask1;
	TButton *Strategy_ON;
	TButton *Strategy_OF;
	TButton *StrategyR22Run;
	TLabel *R22Bid1;
	TLabel *Label8;
	TLabel *R22Date1;
	TLabel *R22Spread1;
	TLabel *Label12;
	TLabel *R22Digits1;
	TPanel *Panel13;
	TButton *Button1;
	TPanel *Panel9;
	TLabel *Label14;
	TLabel *R22Ask2;
	TLabel *R22Bid2;
	TLabel *Label17;
	TLabel *R22Date2;
	TLabel *R22Spread2;
	TLabel *Label21;
	TLabel *R22Digits2;
	TPanel *Panel14;
	TButton *Button2;
	TPanel *Panel15;
	TButton *onSaving;
	TButton *ofSaving;
	TLabel *Label6;
	TLabel *Label7;
	TCheckBox *StrategyR22Active;
	TLabel *R22_MaxDif;
	TLabel *Label9;
	TButton *Button3;
	TLabel *Label10;
	TLabel *R22_AllSpread;
	TLabel *sqdsq;
	TLabel *Label15;
	TLabel *R22_AskDif;
	TLabel *R22_MinDif;
	TStringGrid *FastTrade;
	TPanel *Panel11;
	TStringGrid *SlowTrade;
	TButton *R22Clear;
	TLabel *Label11;
	TEdit *FastSize;
	TLabel *Label13;
	TEdit *SlowSize;
	TLabel *Label16;
	TEdit *Code1;
	TEdit *Code2;
	TPageControl *PageControl3;
	TTabSheet *TabSheet7;
	TTabSheet *TabSheet8;
	TGroupBox *GroupBox1;
	TRadioButton *Hunting;
	TRadioButton *Catching;
	TGroupBox *GroupBox2;
	TEdit *MyMaxSpread;
	TGroupBox *GroupBox3;
	TEdit *MyMaxDif;
	TGroupBox *GroupBox4;
	TEdit *MyMinDif;
	TGroupBox *GroupBox7;
	TEdit *reseverid;
	TClientSocket *C2;
	TClientSocket *C1;
	TTabSheet *TabSheet9;
	TButton *Button4;
	TButton *Button5;
	TButton *Button6;
	TButton *Button7;
	TLabel *Label20;
	TEdit *Edit10;
	TEdit *Edit11;
	TButton *Button8;
	TButton *Button9;
	TButton *Button10;
	TButton *Button11;
	TButton *Button12;
	TGroupBox *GroupBox5;
	TEdit *Edit7;
	TGroupBox *GroupBox8;
	TEdit *Edit1;
	TLabel *Label22;
	TLabel *Label23;
	TLabel *LabelState;
	TTabSheet *TabSheet10;
	TButton *TestSpeed;
	TEdit *TTT22;
	TEdit *sddsd;
	TEdit *qsd98;
	TButton *bChart;
	TCheckBox *DivMod;
	TButton *Button13;
	TGroupBox *GroupBox6;
	TLabel *Label18;
	TLabel *Label19;
	TEdit *Portc1;
	TEdit *Portc2;
	void __fastcall bStartResivingClick(TObject *Sender);
	void __fastcall serverClientConnect(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall serverClientWrite(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall serverClientRead(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall bStopResivingClick(TObject *Sender);
	void __fastcall DataTimerTimer(TObject *Sender);
	void __fastcall bRefClick(TObject *Sender);
	void __fastcall SaveAllClick(TObject *Sender);
	void __fastcall DataSaveTimerTimer(TObject *Sender);
	void __fastcall ofSavingClick(TObject *Sender);
	void __fastcall Strategy_ONClick(TObject *Sender);
	void __fastcall Strategy_OFClick(TObject *Sender);
	void __fastcall onSavingClick(TObject *Sender);
	void __fastcall StrategyR22RunClick(TObject *Sender);
	void __fastcall R22ClearClick(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Button10Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall Button11Click(TObject *Sender);
	void __fastcall Button12Click(TObject *Sender);
	void __fastcall Button8Click(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall C1Read(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall C2Read(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall TestSpeedClick(TObject *Sender);
	void __fastcall bChartClick(TObject *Sender);
	void __fastcall DivModClick(TObject *Sender);
	void __fastcall Button13Click(TObject *Sender);



private:	// Déclarations utilisateur
public:		// Déclarations utilisateur
	__fastcall Tapp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE Tapp *app;
//---------------------------------------------------------------------------
#endif
