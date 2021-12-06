//---------------------------------------------------------------------------

#ifndef chartsH
#define chartsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <VCLTee.Chart.hpp>
#include <VCLTee.Series.hpp>
#include <VclTee.TeeGDIPlus.hpp>
#include <VCLTee.TeEngine.hpp>
#include <VCLTee.TeeProcs.hpp>
#include <System.Win.ScktComp.hpp>
#include <VCLTee.TeeFunci.hpp>
#include <VCLTee.GanttCh.hpp>
#include <Vcl.ComCtrls.hpp>
//---------------------------------------------------------------------------
class TF2 : public TForm
{
__published:	// IDE-managed Components
	TChart *Chart1;
	TTimer *Timer1;
	TLabel *Label1;
	TCheckBox *CheckBox1;
	TLabel *Label8;
	TGroupBox *GroupBox1;
	TChart *Chart2;
	TPanel *Panel1;
	TClientSocket *C1;
	TTimer *Timer2;
	TLineSeries *Series1;
	TLineSeries *Series2;
	TGroupBox *GroupBox8;
	TChart *Chart3;
	TLineSeries *Series3;
	TLineSeries *Series5;
	TLineSeries *Series4;
	TLineSeries *Series6;
	TLineSeries *Series7;
	TPanel *Panel2;
	TPanel *ss;
	TPageControl *PageControl1;
	TTabSheet *TabSheet1;
	TTabSheet *TabSheet2;
	TTabSheet *TabSheet3;
	TButton *Button1;
	TEdit *Edit1;
	TEdit *Edit4;
	TLabel *Label3;
	TLabel *Label2;
	TButton *Button3;
	TGroupBox *GroupBox2;
	TEdit *Edit7;
	TEdit *Edit2;
	TLabel *Label7;
	TEdit *Edit6;
	TLabel *Label13;
	TLabel *Label5;
	TEdit *Edit3;
	TLabel *Label6;
	TEdit *Edit5;
	TGroupBox *GroupBox7;
	TLabel *Label23;
	TLabel *LabelState;
	TRadioButton *Hunting;
	TRadioButton *Catching;
	TGroupBox *GroupBox5;
	TLabel *Label11;
	TLabel *Label12;
	TLabel *Label4;
	TLabel *Label14;
	TLabel *Label9;
	TLabel *Label10;
	TGroupBox *GroupBox4;
	TComboBox *R22_list1;
	TComboBox *R22_list2;
	TLabel *Label18;
	TEdit *Edit11;
	TEdit *Edit12;
	TLabel *Label19;
	TLabel *Label20;
	TEdit *Edit13;
	TGroupBox *GroupBox6;
	TGroupBox *GroupBox12;
	TLabel *Label35;
	TLabel *Label37;
	TEdit *Portc1;
	TButton *Button2;
	TLabel *Label25;
	TLabel *Label24;
	TLabel *Label15;
	TLabel *Label16;
	TLabel *Label17;
	TLabel *Label21;
	TLabel *Label22;
	TLabel *Label26;
	TLabel *Label27;
	TLabel *Label28;
	TLabel *Label29;
	TGroupBox *GroupBox3;
	TLabel *Label30;
	TLabel *Label31;
	TComboBox *ComboBox1;
	TComboBox *ComboBox2;
	TLabel *Label32;
	TLabel *Label33;
	TComboBox *ComboBox3;
	TComboBox *ComboBox4;
	TButton *Button4;
	void __fastcall Timer1Timer(TObject *Sender);
	void __fastcall CheckBox1Click(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Chart1MouseEnter(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall C1Read(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall C2Read(TObject *Sender, TCustomWinSocket *Socket);
	void __fastcall Timer2Timer(TObject *Sender);
	void __fastcall Panel1MouseEnter(TObject *Sender);
	void __fastcall ssMouseEnter(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall R22_list1MouseEnter(TObject *Sender);
	void __fastcall R22_list2MouseEnter(TObject *Sender);
	void __fastcall Portc1Change(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall ComboBox1Change(TObject *Sender);
	void __fastcall ComboBox2Change(TObject *Sender);
	void __fastcall ComboBox3Change(TObject *Sender);
	void __fastcall ComboBox4Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TF2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TF2 *F2;
//---------------------------------------------------------------------------
#endif
