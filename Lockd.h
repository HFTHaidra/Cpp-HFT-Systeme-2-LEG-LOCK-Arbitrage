//---------------------------------------------------------------------------

#ifndef LockdH
#define LockdH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <VCLTee.Chart.hpp>
#include <VCLTee.Series.hpp>
#include <VclTee.TeeGDIPlus.hpp>
#include <VCLTee.TeEngine.hpp>
#include <VCLTee.TeeProcs.hpp>
#include <System.Win.ScktComp.hpp>
//---------------------------------------------------------------------------
class TF3 : public TForm
{
__published:	// IDE-managed Components
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TLabel *Label2;
	TButton *Button1;
	TEdit *Edit1;
	TComboBox *FastList;
	TComboBox *SlowList1;
	TTabSheet *TabSheet2;
	TLabel *Label7;
	TLabel *Label13;
	TLabel *Label6;
	TLabel *Label15;
	TLabel *Label16;
	TLabel *Label17;
	TGroupBox *GroupBox2;
	TEdit *Edit7;
	TEdit *Edit2;
	TEdit *Edit6;
	TEdit *Edit5;
	TEdit *Edit8;
	TEdit *Edit9;
	TEdit *Edit10;
	TGroupBox *GroupBox4;
	TLabel *Label18;
	TLabel *Label19;
	TLabel *Label20;
	TEdit *Edit11;
	TEdit *Edit12;
	TEdit *Edit13;
	TTabSheet *TabSheet3;
	TButton *Button2;
	TButton *Button3;
	TGroupBox *GroupBox7;
	TRadioButton *Hunting;
	TRadioButton *Catching;
	TGroupBox *GroupBox5;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label4;
	TLabel *Label14;
	TLabel *Label9;
	TLabel *Label10;
	TGroupBox *GroupBox6;
	TLabel *Label21;
	TLabel *label90;
	TLabel *Label22;
	TChart *Chart1;
	TLabel *Label1;
	TLabel *Label8;
	TCheckBox *CheckBox1;
	TGroupBox *GroupBox8;
	TChart *Chart3;
	TPanel *Panel2;
	TPanel *ss;
	TLineSeries *Series1;
	TLineSeries *Series2;
	TPanel *Panel1;
	TLabel *Label24;
	TLabel *Label25;
	TComboBox *SlowList2;
	TLabel *Label26;
	TCheckBox *CheckBox2;
	TCheckBox *CheckBox3;
	TCheckBox *CheckBox4;
	TCheckBox *CheckBox5;
	TGroupBox *GroupBox1;
	TGroupBox *GroupBox3;
	TGroupBox *GroupBox9;
	TGroupBox *GroupBox10;
	TEdit *Edit3;
	TEdit *Edit14;
	TEdit *Edit15;
	TEdit *Edit16;
	TEdit *Edit17;
	TLabel *Label5;
	TLabel *Label23;
	TGroupBox *GroupBox11;
	TLabel *Label27;
	TLabel *Label28;
	TTimer *Timer1;
	TTimer *Timer2;
	TLineSeries *Series3;
	TLabel *Label33;
	TLabel *Label34;
	TLineSeries *Series4;
	TEdit *Edit4;
	TLabel *Label3;
	TClientSocket *C1;
	TClientSocket *C2;
	TGroupBox *GroupBox12;
	TLabel *Label35;
	TLabel *Label36;
	TEdit *Portc1;
	TEdit *Portc2;
	TLabel *Label37;
	TLabel *Label38;
	TButton *Button4;
	TLabel *Label39;
	TLabel *Label40;
	TLabel *Label41;
	TLabel *Label42;
	TLabel *Label43;
	TLabel *Label29;
	TLabel *Label30;
	TLabel *LabelState;
	TLabel *LS;
	void __fastcall Timer2Timer(TObject *Sender);
	void __fastcall FastListEnter(TObject *Sender);
	void __fastcall Chart1MouseEnter(TObject *Sender);
	void __fastcall Panel1MouseEnter(TObject *Sender);
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall Portc1Change(TObject *Sender);
	void __fastcall Portc2Change(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall C1Read(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall C2Read(TObject *Sender, TCustomWinSocket *Socket);
private:	// User declarations
public:		// User declarations
	__fastcall TF3(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TF3 *F3;
//---------------------------------------------------------------------------
#endif
