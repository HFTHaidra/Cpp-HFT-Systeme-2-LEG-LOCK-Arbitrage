object app: Tapp
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #1581#1610#1583#1585#1577
  ClientHeight = 407
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 80
    Height = 407
    Align = alLeft
    Caption = ' '
    Color = clMenuBar
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 51
      Width = 51
      Height = 13
      Caption = 'Saving ...!'
    end
    object bStartResiving: TButton
      Left = 1
      Top = 1
      Width = 78
      Height = 25
      Align = alTop
      Caption = 'Start Resiving'
      TabOrder = 0
      OnClick = bStartResivingClick
    end
    object bStopResiving: TButton
      Left = 6
      Top = 25
      Width = 69
      Height = 20
      Caption = 'Stop'
      Enabled = False
      TabOrder = 1
      OnClick = bStopResivingClick
    end
    object Panel5: TPanel
      Left = -12
      Top = 46
      Width = 112
      Height = 4
      Caption = ' '
      Color = clHotLight
      ParentBackground = False
      TabOrder = 2
    end
    object Panel15: TPanel
      Left = 7
      Top = 70
      Width = 65
      Height = 35
      Caption = ' '
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 3
      object onSaving: TButton
        Left = 5
        Top = 5
        Width = 25
        Height = 25
        Caption = 'ON'
        TabOrder = 0
        OnClick = onSavingClick
      end
      object ofSaving: TButton
        Left = 36
        Top = 5
        Width = 25
        Height = 25
        Caption = 'OF'
        Enabled = False
        TabOrder = 1
        OnClick = ofSavingClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 1
      Top = 363
      Width = 73
      Height = 43
      Caption = 'Rsever ID '
      TabOrder = 4
      object reseverid: TEdit
        Left = 11
        Top = 16
        Width = 46
        Height = 21
        MaxLength = 5
        NumbersOnly = True
        TabOrder = 0
        Text = '27030'
      end
    end
    object bChart: TButton
      Left = 4
      Top = 117
      Width = 75
      Height = 25
      Caption = 'HFT Stratigy'
      TabOrder = 5
      OnClick = bChartClick
    end
    object Button13: TButton
      Left = 4
      Top = 148
      Width = 75
      Height = 25
      Caption = 'HFT Lock'
      TabOrder = 6
      OnClick = Button13Click
    end
  end
  object Panel2: TPanel
    Left = 80
    Top = 0
    Width = 594
    Height = 407
    Align = alClient
    Caption = ' '
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 1
    object PageControl1: TPageControl
      Left = -4
      Top = 1
      Width = 603
      Height = 411
      ActivePage = TabSheet2
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Data Saving'
        object PageControl2: TPageControl
          Left = -4
          Top = 3
          Width = 589
          Height = 377
          ActivePage = TabSheet5
          TabOrder = 0
          object TabSheet5: TTabSheet
            Caption = ' '
            object bRef: TButton
              Left = 13
              Top = 3
              Width = 89
              Height = 19
              Caption = 'bRef'
              TabOrder = 0
              OnClick = bRefClick
            end
            object symGrid: TStringGrid
              Left = 3
              Top = 28
              Width = 577
              Height = 318
              BevelWidth = 20
              ColCount = 6
              DefaultColWidth = 100
              DefaultRowHeight = 20
              DragKind = dkDock
              FixedColor = clBtnShadow
              FixedCols = 0
              RowCount = 21
              GridLineWidth = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              ColWidths = (
                151
                101
                138
                88
                169
                149)
            end
            object SaveAll: TButton
              Left = 495
              Top = 3
              Width = 75
              Height = 19
              Caption = 'Save All'
              TabOrder = 2
              OnClick = SaveAllClick
            end
          end
          object TabSheet6: TTabSheet
            Caption = 'memoSaving'
            Enabled = False
            ImageIndex = 1
            object SavingMemo: TMemo
              Left = 3
              Top = 40
              Width = 575
              Height = 306
              TabOrder = 0
            end
          end
          object TabSheet10: TTabSheet
            Caption = 'TabSheet10'
            ImageIndex = 2
            object TestSpeed: TButton
              Left = 16
              Top = 96
              Width = 113
              Height = 33
              Caption = 'TestSpeed'
              TabOrder = 0
              OnClick = TestSpeedClick
            end
            object TTT22: TEdit
              Left = 152
              Top = 102
              Width = 137
              Height = 21
              TabOrder = 1
              Text = '100'
            end
            object sddsd: TEdit
              Left = 152
              Top = 153
              Width = 161
              Height = 21
              TabOrder = 2
              Text = 'Strart'
            end
            object qsd98: TEdit
              Left = 152
              Top = 196
              Width = 161
              Height = 21
              TabOrder = 3
              Text = 'End'
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Arbitrage Classic'
        ImageIndex = 1
        object Panel6: TPanel
          Left = 5
          Top = -8
          Width = 599
          Height = 401
          Caption = ' '
          Color = clMoneyGreen
          ParentBackground = False
          TabOrder = 0
          object R22_list1: TComboBox
            Left = 9
            Top = 26
            Width = 160
            Height = 21
            Hint = 'Fast Symbol'
            AutoCloseUp = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = 'R22_Symbols'
            StyleElements = [seFont, seBorder]
            Items.Strings = (
              ' ')
          end
          object Panel7: TPanel
            Left = 346
            Top = 26
            Width = 247
            Height = 206
            Caption = ' '
            Color = clCream
            ParentBackground = False
            TabOrder = 1
            object Label4: TLabel
              Left = 104
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Config'
            end
            object Strategy_ON: TButton
              Left = 1
              Top = 1
              Width = 80
              Height = 20
              Caption = 'Strategy ON'
              TabOrder = 0
              OnClick = Strategy_ONClick
            end
            object Strategy_OF: TButton
              Left = 164
              Top = 1
              Width = 80
              Height = 20
              Caption = 'Strategy OF'
              Enabled = False
              TabOrder = 1
              OnClick = Strategy_OFClick
            end
            object StrategyR22Run: TButton
              Left = 138
              Top = 1
              Width = 20
              Height = 20
              Caption = ' '
              TabOrder = 2
              Visible = False
              OnClick = StrategyR22RunClick
            end
            object StrategyR22Active: TCheckBox
              Left = 87
              Top = 2
              Width = 11
              Height = 17
              Caption = ' '
              Enabled = False
              TabOrder = 3
              Visible = False
            end
            object PageControl3: TPageControl
              Left = 0
              Top = 22
              Width = 252
              Height = 184
              ActivePage = TabSheet7
              TabOrder = 4
              object TabSheet7: TTabSheet
                Caption = 'Base'
                object GroupBox1: TGroupBox
                  Left = 3
                  Top = 0
                  Width = 230
                  Height = 40
                  Caption = 'Status'
                  TabOrder = 0
                  object Label23: TLabel
                    Left = 167
                    Top = 16
                    Width = 36
                    Height = 13
                    Caption = 'State : '
                  end
                  object LabelState: TLabel
                    Left = 209
                    Top = 16
                    Width = 10
                    Height = 13
                    Caption = '-1'
                  end
                  object Hunting: TRadioButton
                    Left = 8
                    Top = 12
                    Width = 57
                    Height = 17
                    Caption = 'Hunting'
                    Checked = True
                    TabOrder = 0
                    TabStop = True
                  end
                  object Catching: TRadioButton
                    Left = 79
                    Top = 12
                    Width = 82
                    Height = 17
                    Caption = 'Catching Up'
                    TabOrder = 1
                  end
                end
                object GroupBox2: TGroupBox
                  Left = 4
                  Top = 103
                  Width = 73
                  Height = 50
                  Caption = 'Spread Max'
                  TabOrder = 1
                  object MyMaxSpread: TEdit
                    Left = 16
                    Top = 16
                    Width = 41
                    Height = 21
                    MaxLength = 6
                    NumbersOnly = True
                    TabOrder = 0
                    Text = '600'
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 4
                  Top = 51
                  Width = 73
                  Height = 48
                  Caption = 'Ask Dif Max'
                  TabOrder = 2
                  object MyMaxDif: TEdit
                    Left = 16
                    Top = 16
                    Width = 41
                    Height = 21
                    MaxLength = 6
                    TabOrder = 0
                    Text = '-10'
                  end
                end
                object GroupBox4: TGroupBox
                  Left = 83
                  Top = 51
                  Width = 73
                  Height = 48
                  Caption = 'Ask Dif Min'
                  TabOrder = 3
                  object MyMinDif: TEdit
                    Left = 16
                    Top = 16
                    Width = 41
                    Height = 21
                    MaxLength = 6
                    TabOrder = 0
                    Text = '-1000'
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 162
                  Top = 46
                  Width = 73
                  Height = 78
                  Caption = 'Sender ID '
                  TabOrder = 4
                  object Label18: TLabel
                    Left = 4
                    Top = 24
                    Width = 19
                    Height = 13
                    Caption = 'S1 :'
                  end
                  object Label19: TLabel
                    Left = 3
                    Top = 48
                    Width = 22
                    Height = 13
                    Caption = 'S2 : '
                  end
                  object Portc1: TEdit
                    Left = 29
                    Top = 21
                    Width = 41
                    Height = 21
                    MaxLength = 5
                    NumbersOnly = True
                    TabOrder = 0
                    Text = '27401'
                  end
                  object Portc2: TEdit
                    Left = 29
                    Top = 48
                    Width = 41
                    Height = 21
                    MaxLength = 5
                    NumbersOnly = True
                    TabOrder = 1
                    Text = '27501'
                  end
                end
              end
              object TabSheet8: TTabSheet
                Caption = 'Timing'
                ImageIndex = 1
                object GroupBox5: TGroupBox
                  Left = 3
                  Top = 3
                  Width = 80
                  Height = 48
                  Caption = 'Time Ererr ms'
                  TabOrder = 0
                  object Edit7: TEdit
                    Left = 16
                    Top = 16
                    Width = 49
                    Height = 21
                    MaxLength = 6
                    NumbersOnly = True
                    TabOrder = 0
                    Text = '20000'
                  end
                end
                object GroupBox8: TGroupBox
                  Left = 99
                  Top = 3
                  Width = 142
                  Height = 48
                  Caption = 'Time For Each Trade  ms'
                  TabOrder = 1
                  object Label22: TLabel
                    Left = 71
                    Top = 20
                    Width = 56
                    Height = 13
                    Caption = '1000ms=1s'
                  end
                  object Edit1: TEdit
                    Left = 16
                    Top = 16
                    Width = 49
                    Height = 21
                    MaxLength = 6
                    NumbersOnly = True
                    TabOrder = 0
                    Text = '20000'
                  end
                end
              end
              object TabSheet9: TTabSheet
                Caption = 'Testing 1'
                ImageIndex = 2
                object Label20: TLabel
                  Left = 3
                  Top = 6
                  Width = 35
                  Height = 13
                  Caption = 'Code : '
                end
                object Button4: TButton
                  Left = 3
                  Top = 38
                  Width = 30
                  Height = 25
                  Caption = 'Sell1'
                  TabOrder = 0
                  OnClick = Button4Click
                end
                object Button5: TButton
                  Left = 84
                  Top = 38
                  Width = 37
                  Height = 25
                  Caption = 'Sell2'
                  TabOrder = 1
                  OnClick = Button5Click
                end
                object Button6: TButton
                  Left = 165
                  Top = 38
                  Width = 75
                  Height = 25
                  Caption = 'Open All'
                  TabOrder = 2
                  OnClick = Button6Click
                end
                object Button7: TButton
                  Left = 3
                  Top = 69
                  Width = 75
                  Height = 25
                  Caption = 'Close 1'
                  TabOrder = 3
                  OnClick = Button7Click
                end
                object Edit10: TEdit
                  Left = 56
                  Top = 3
                  Width = 58
                  Height = 21
                  Hint = 'Comment'
                  MaxLength = 10
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  Text = ' R22'
                end
                object Edit11: TEdit
                  Left = 120
                  Top = 3
                  Width = 39
                  Height = 21
                  Hint = 'Code Of Order'
                  MaxLength = 10
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = '1'
                end
                object Button8: TButton
                  Left = 84
                  Top = 69
                  Width = 75
                  Height = 25
                  Caption = 'Close 2'
                  TabOrder = 6
                  OnClick = Button8Click
                end
                object Button9: TButton
                  Left = 166
                  Top = 69
                  Width = 75
                  Height = 25
                  Caption = 'Close All'
                  TabOrder = 7
                end
                object Button10: TButton
                  Left = 165
                  Top = 7
                  Width = 60
                  Height = 25
                  Caption = 'Test'
                  TabOrder = 8
                  OnClick = Button10Click
                end
                object Button11: TButton
                  Left = 127
                  Top = 38
                  Width = 33
                  Height = 25
                  Caption = 'Buy2'
                  TabOrder = 9
                  OnClick = Button11Click
                end
                object Button12: TButton
                  Left = 39
                  Top = 38
                  Width = 34
                  Height = 25
                  Caption = 'buy1'
                  TabOrder = 10
                  OnClick = Button12Click
                end
              end
            end
          end
          object R22_list2: TComboBox
            Left = 175
            Top = 26
            Width = 160
            Height = 21
            Hint = 'Slow Symbol'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Text = 'R22_Symbols'
            Items.Strings = (
              'XXL'
              'MMS')
          end
          object Panel8: TPanel
            Left = 9
            Top = 53
            Width = 160
            Height = 84
            Caption = ' '
            Color = clCream
            ParentBackground = False
            TabOrder = 3
            object Label5: TLabel
              Left = 8
              Top = 24
              Width = 27
              Height = 13
              Caption = 'Ask : '
            end
            object R22Ask1: TLabel
              Left = 41
              Top = 24
              Width = 18
              Height = 13
              Caption = '600'
            end
            object R22Bid1: TLabel
              Left = 41
              Top = 43
              Width = 18
              Height = 13
              Caption = '600'
            end
            object Label8: TLabel
              Left = 8
              Top = 43
              Width = 24
              Height = 13
              Caption = 'Bid : '
            end
            object R22Date1: TLabel
              Left = 8
              Top = 7
              Width = 21
              Height = 11
              Caption = '600'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clHighlight
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object R22Spread1: TLabel
              Left = 64
              Top = 62
              Width = 21
              Height = 16
              Caption = '600'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 120
              Top = 24
              Width = 33
              Height = 13
              Caption = 'Digits :'
            end
            object R22Digits1: TLabel
              Left = 127
              Top = 39
              Width = 18
              Height = 13
              Caption = '600'
            end
            object Label6: TLabel
              Left = 8
              Top = 62
              Width = 50
              Height = 16
              Caption = 'Spread :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Panel13: TPanel
              Left = -3
              Top = 58
              Width = 200
              Height = 1
              Caption = ' '
              Color = clHotLight
              ParentBackground = False
              TabOrder = 0
            end
            object Button1: TButton
              Left = 136
              Top = 60
              Width = 20
              Height = 20
              Caption = '!'
              TabOrder = 1
            end
          end
          object Panel10: TPanel
            Left = 9
            Top = 141
            Width = 331
            Height = 50
            Caption = ' '
            Color = clCream
            ParentBackground = False
            TabOrder = 4
            object R22_MaxDif: TLabel
              Left = 254
              Top = 8
              Width = 28
              Height = 13
              Caption = '-6000'
            end
            object Label9: TLabel
              Left = 166
              Top = 8
              Width = 82
              Height = 13
              Caption = 'Max Variance -> '
            end
            object Label10: TLabel
              Left = 9
              Top = 8
              Width = 95
              Height = 13
              Caption = 'Sum Spread ------> '
            end
            object R22_AllSpread: TLabel
              Left = 116
              Top = 8
              Width = 18
              Height = 13
              Caption = '600'
            end
            object sqdsq: TLabel
              Left = 9
              Top = 27
              Width = 93
              Height = 13
              Caption = 'Ask Difference --->'
            end
            object Label15: TLabel
              Left = 166
              Top = 27
              Width = 82
              Height = 13
              Caption = 'Min Variance --> '
            end
            object R22_AskDif: TLabel
              Left = 116
              Top = 27
              Width = 18
              Height = 13
              Caption = '600'
            end
            object R22_MinDif: TLabel
              Left = 254
              Top = 27
              Width = 24
              Height = 13
              Caption = '6000'
            end
            object Button3: TButton
              Left = 280
              Top = 120
              Width = 51
              Height = 18
              Caption = 'Sweep'
              TabOrder = 0
            end
            object R22Clear: TButton
              Left = 311
              Top = 0
              Width = 20
              Height = 20
              Hint = 'Clear'
              Caption = 'c'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = R22ClearClick
            end
          end
          object Panel12: TPanel
            Left = 10
            Top = 238
            Width = 583
            Height = 153
            Caption = ' '
            Color = clCream
            ParentBackground = False
            TabOrder = 5
            object FastTrade: TStringGrid
              Left = 2
              Top = 2
              Width = 578
              Height = 73
              BevelWidth = 14
              ColCount = 10
              DefaultColWidth = 40
              DefaultRowHeight = 14
              DragKind = dkDock
              FixedColor = clBtnShadow
              FixedCols = 0
              RowCount = 11
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              ParentFont = False
              ParentShowHint = False
              ScrollBars = ssNone
              ShowHint = True
              TabOrder = 0
              ColWidths = (
                19
                150
                36
                39
                90
                74
                60
                139
                40
                40)
            end
            object SlowTrade: TStringGrid
              Left = 2
              Top = 78
              Width = 578
              Height = 73
              BevelWidth = 14
              ColCount = 10
              DefaultColWidth = 40
              DefaultRowHeight = 14
              DragKind = dkDock
              FixedColor = clBtnShadow
              FixedCols = 0
              RowCount = 11
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              GridLineWidth = 0
              ParentFont = False
              ParentShowHint = False
              ScrollBars = ssNone
              ShowHint = True
              TabOrder = 1
              ColWidths = (
                19
                150
                36
                39
                92
                74
                60
                139
                40
                40)
            end
          end
          object Panel9: TPanel
            Left = 175
            Top = 53
            Width = 165
            Height = 84
            Caption = ' '
            Color = clCream
            ParentBackground = False
            TabOrder = 6
            object Label14: TLabel
              Left = 8
              Top = 24
              Width = 27
              Height = 13
              Caption = 'Ask : '
            end
            object R22Ask2: TLabel
              Left = 41
              Top = 24
              Width = 18
              Height = 13
              Caption = '600'
            end
            object R22Bid2: TLabel
              Left = 41
              Top = 43
              Width = 18
              Height = 13
              Caption = '600'
            end
            object Label17: TLabel
              Left = 8
              Top = 43
              Width = 24
              Height = 13
              Caption = 'Bid : '
            end
            object R22Date2: TLabel
              Left = 8
              Top = 7
              Width = 21
              Height = 11
              Caption = '600'
              Color = clSkyBlue
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clHighlight
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object R22Spread2: TLabel
              Left = 74
              Top = 62
              Width = 21
              Height = 16
              Caption = '600'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 112
              Top = 24
              Width = 33
              Height = 13
              Caption = 'Digits :'
            end
            object R22Digits2: TLabel
              Left = 119
              Top = 40
              Width = 18
              Height = 13
              Caption = '600'
            end
            object Label7: TLabel
              Left = 14
              Top = 62
              Width = 54
              Height = 16
              Caption = 'Spread : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Panel14: TPanel
              Left = -3
              Top = 58
              Width = 200
              Height = 1
              Caption = ' '
              Color = clHotLight
              ParentBackground = False
              TabOrder = 0
            end
            object Button2: TButton
              Left = 136
              Top = 60
              Width = 20
              Height = 20
              Caption = '!'
              TabOrder = 1
            end
          end
          object Panel11: TPanel
            Left = 9
            Top = 197
            Width = 331
            Height = 35
            Color = clCream
            ParentBackground = False
            TabOrder = 7
            object Label11: TLabel
              Left = 8
              Top = 8
              Width = 53
              Height = 13
              Caption = 'Fast Size : '
            end
            object Label13: TLabel
              Left = 104
              Top = 8
              Width = 54
              Height = 13
              Caption = 'Slow Size : '
            end
            object Label16: TLabel
              Left = 202
              Top = 8
              Width = 35
              Height = 13
              Caption = 'Code : '
            end
            object FastSize: TEdit
              Left = 64
              Top = 6
              Width = 35
              Height = 21
              MaxLength = 5
              TabOrder = 0
              Text = '1'
            end
            object SlowSize: TEdit
              Left = 162
              Top = 6
              Width = 35
              Height = 21
              MaxLength = 5
              TabOrder = 1
              Text = '1'
            end
            object Code1: TEdit
              Left = 240
              Top = 6
              Width = 58
              Height = 21
              Hint = 'Comment'
              MaxLength = 10
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Text = ' R022'
            end
            object Code2: TEdit
              Left = 300
              Top = 6
              Width = 20
              Height = 21
              Hint = 'Code Of Order'
              MaxLength = 5
              NumbersOnly = True
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
              Text = '1'
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 605
      Top = 197
      Width = 177
      Height = 44
      Caption = 'Panel3'
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 1
      object bConsole: TButton
        Left = 48
        Top = 9
        Width = 113
        Height = 25
        Caption = 'Printf(String Str);'
        TabOrder = 0
      end
    end
    object DivMod: TCheckBox
      Left = 527
      Top = 2
      Width = 97
      Height = 17
      Caption = 'Div Mode'
      TabOrder = 2
      Visible = False
      OnClick = DivModClick
    end
  end
  object server: TServerSocket
    Active = False
    Port = 2700
    ServerType = stNonBlocking
    OnClientConnect = serverClientConnect
    OnClientRead = serverClientRead
    OnClientWrite = serverClientWrite
    Left = 497
    Top = 352
  end
  object DataTimer: TTimer
    OnTimer = DataTimerTimer
    Left = 688
    Top = 264
  end
  object DataSaveTimer: TTimer
    Interval = 12000000
    OnTimer = DataSaveTimerTimer
    Left = 713
    Top = 321
  end
  object C2: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'localhost'
    Port = 27501
    OnRead = C2Read
    Left = 568
    Top = 352
  end
  object C1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'localhost'
    Port = 27401
    OnRead = C1Read
    Left = 536
    Top = 352
  end
end
