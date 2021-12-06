object F3: TF3
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 
    'Locking Arbitrage_ 2 Leg Lock Hidden Forex Trading Software  '#1575#1604#1575 +
    #1587#1605' '#1575#1604#1603#1604#1610' '#1604#1604#1575#1587#1578#1585#1575#1578#1580#1610#1577' '#1575#1582#1601#1575#1569' '#1608#1602#1578'  '#1587#1585#1610#1575#1606' '#1575#1604#1589#1601#1602#1577' '#1604#1571#1603#1579#1585' '#1605#1606' 5 '#1583#1602#1575#1574#1602' + ' +
    #1593#1583#1583' '#1575#1604#1606#1602#1575#1591' '#1575#1604#1585#1575#1576#1581#1577' '#1575#1608' '#1575#1604#1582#1575#1587#1585#1577' '#1575#1603#1576#1585' '#1575#1610#1590#1575
  ClientHeight = 517
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelState: TLabel
    Left = 143
    Top = 397
    Width = 10
    Height = 13
    Caption = '-1'
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 164
    Height = 517
    ActivePage = TabSheet1
    Align = alLeft
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Home'
      object Label2: TLabel
        Left = 3
        Top = 33
        Width = 89
        Height = 13
        Caption = 'Tick Max Of Chart '
      end
      object Label24: TLabel
        Left = 44
        Top = 57
        Width = 48
        Height = 13
        Caption = 'Fast Feed'
      end
      object Label25: TLabel
        Left = 3
        Top = 113
        Width = 132
        Height = 13
        Caption = 'Slow Feed 1 For Sell Orders'
      end
      object Label26: TLabel
        Left = 3
        Top = 185
        Width = 137
        Height = 13
        Caption = 'Slow Feed 2 For Buy Orders '
      end
      object Label41: TLabel
        Left = 62
        Top = 132
        Width = 92
        Height = 13
        Caption = #1610#1578#1605' '#1575#1585#1587#1575#1604' '#1589#1601#1602#1577' '#1576#1610#1593
      end
      object Label42: TLabel
        Left = 51
        Top = 204
        Width = 102
        Height = 13
        Caption = #1610#1578#1605' '#1575#1585#1587#1575#1604' '#1589#1601#1602#1577' '#1588#1585#1575#1569
      end
      object Button1: TButton
        Left = 102
        Top = 3
        Width = 51
        Height = 18
        Caption = 'Resfrech'
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 98
        Top = 30
        Width = 40
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '100'
      end
      object FastList: TComboBox
        Left = 3
        Top = 76
        Width = 131
        Height = 21
        Hint = 'Fast Symbol'
        AutoCloseUp = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Fast Symbol'
        StyleElements = [seFont, seBorder]
        OnEnter = FastListEnter
        Items.Strings = (
          #1593#1576#1583' '#1602#1575#1583#1585' '
          #1605#1581#1605#1583' '
          #1575#1604#1593#1580#1575#1604
          #1608#1607#1585#1575#1606#1610' '
          #1605#1587#1578#1594#1575#1606#1605#1610' '
          #1587#1591#1575#1610#1601#1610)
      end
      object SlowList1: TComboBox
        Left = 3
        Top = 146
        Width = 130
        Height = 21
        Hint = 'Slow Symbol'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = 'Slow Symbol'
        Items.Strings = (
          #1593#1576#1583' '#1602#1575#1583#1585' '
          #1605#1581#1605#1583' '
          #1575#1604#1593#1580#1575#1604)
      end
      object SlowList2: TComboBox
        Left = 3
        Top = 218
        Width = 130
        Height = 21
        Hint = 'Slow Symbol'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = 'Slow Symbol'
        Items.Strings = (
          #1593#1576#1583' '#1602#1575#1583#1585' '
          #1605#1581#1605#1583' '
          #1575#1604#1593#1580#1575#1604)
      end
      object GroupBox12: TGroupBox
        Left = 1
        Top = 399
        Width = 153
        Height = 78
        Caption = 'Sender ID '
        TabOrder = 5
        object Label35: TLabel
          Left = 84
          Top = 24
          Width = 19
          Height = 13
          Caption = 'S1 :'
        end
        object Label36: TLabel
          Left = 83
          Top = 48
          Width = 22
          Height = 13
          Caption = 'S2 : '
        end
        object Label37: TLabel
          Left = 3
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Slow Broker Port'
        end
        object Label38: TLabel
          Left = 3
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Slow Broker Port'
        end
        object Portc1: TEdit
          Left = 109
          Top = 21
          Width = 41
          Height = 21
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 0
          Text = '27401'
          OnChange = Portc1Change
        end
        object Portc2: TEdit
          Left = 109
          Top = 48
          Width = 41
          Height = 21
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 1
          Text = '27501'
          OnChange = Portc2Change
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Config'
      ImageIndex = 1
      object Label7: TLabel
        Left = 3
        Top = 54
        Width = 40
        Height = 13
        Caption = 'Profit($)'
      end
      object Label13: TLabel
        Left = 137
        Top = 59
        Width = 16
        Height = 13
        Caption = '/10'
      end
      object Label6: TLabel
        Left = 3
        Top = 80
        Width = 62
        Height = 13
        Caption = 'iSignals Max:'
      end
      object Label15: TLabel
        Left = 3
        Top = 106
        Width = 59
        Height = 13
        Caption = 'Time To Run'
      end
      object Label16: TLabel
        Left = 90
        Top = 104
        Width = 5
        Height = 16
        Caption = ':'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label17: TLabel
        Left = 120
        Top = 104
        Width = 5
        Height = 16
        Caption = ':'
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 115
        Top = 473
        Width = 38
        Height = 13
        Caption = #1605#1604#1575#1581#1592#1577' '
      end
      object Label23: TLabel
        Left = 16
        Top = 472
        Width = 90
        Height = 13
        Caption = '1m=60s=60000ms'
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 3
        Width = 74
        Height = 42
        Caption = '   Max/Min    '
        TabOrder = 0
        object Edit7: TEdit
          Left = 39
          Top = 16
          Width = 30
          Height = 21
          TabOrder = 0
          Text = '-700'
        end
        object Edit2: TEdit
          Left = 3
          Top = 16
          Width = 30
          Height = 21
          TabOrder = 1
          Text = '700'
        end
      end
      object Edit6: TEdit
        Left = 91
        Top = 54
        Width = 42
        Height = 21
        Hint = '60/10 =6.0$'
        MaxLength = 4
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '30'
        TextHint = '60/10 =6.0$'
      end
      object Edit5: TEdit
        Left = 90
        Top = 78
        Width = 42
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        Text = '10'
      end
      object Edit8: TEdit
        Left = 68
        Top = 104
        Width = 20
        Height = 21
        Hint = 'H'
        Ctl3D = True
        MaxLength = 2
        NumbersOnly = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '06'
      end
      object Edit9: TEdit
        Left = 98
        Top = 104
        Width = 20
        Height = 21
        Hint = 'M'
        Ctl3D = True
        MaxLength = 2
        NumbersOnly = True
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = '00'
      end
      object Edit10: TEdit
        Left = 127
        Top = 104
        Width = 20
        Height = 21
        Hint = 'S'
        MaxLength = 2
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = '00'
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 320
        Width = 144
        Height = 137
        Caption = '           Trades Info          '
        TabOrder = 6
        object Label18: TLabel
          Left = 3
          Top = 18
          Width = 47
          Height = 13
          Caption = 'Lot Size : '
        end
        object Label19: TLabel
          Left = 81
          Top = 16
          Width = 5
          Height = 19
          Caption = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 12
          Top = 43
          Width = 126
          Height = 13
          Caption = 'Comment  Slow Broker 1 : '
        end
        object Label3: TLabel
          Left = 12
          Top = 91
          Width = 126
          Height = 13
          Caption = 'Comment  Slow Broker 2 : '
        end
        object Edit11: TEdit
          Left = 61
          Top = 16
          Width = 20
          Height = 21
          Hint = 'H'
          Ctl3D = True
          MaxLength = 2
          NumbersOnly = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '1'
        end
        object Edit12: TEdit
          Left = 87
          Top = 16
          Width = 17
          Height = 21
          Hint = 'H'
          Ctl3D = True
          MaxLength = 1
          NumbersOnly = True
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '0'
        end
        object Edit13: TEdit
          Left = 17
          Top = 62
          Width = 109
          Height = 21
          TabOrder = 2
          Text = 'Play1'
        end
        object Edit4: TEdit
          Left = 17
          Top = 110
          Width = 109
          Height = 21
          TabOrder = 3
          Text = 'Play2'
        end
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 189
        Width = 150
        Height = 44
        Caption = 'Time Close =>New Lockd ms '
        Enabled = False
        TabOrder = 7
        object Edit15: TEdit
          Left = 13
          Top = 17
          Width = 55
          Height = 21
          Enabled = False
          NumbersOnly = True
          TabOrder = 0
          Text = '180000'
        end
        object Edit16: TEdit
          Left = 85
          Top = 17
          Width = 55
          Height = 21
          Enabled = False
          NumbersOnly = True
          TabOrder = 1
          Text = '300000'
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 247
        Width = 150
        Height = 44
        Caption = 'Time Lockd=>New shot ms  '
        TabOrder = 8
        object Label43: TLabel
          Left = 86
          Top = 20
          Width = 50
          Height = 13
          Caption = 'millisecond'
        end
        object Edit17: TEdit
          Left = 25
          Top = 18
          Width = 55
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '300000'
        end
      end
      object GroupBox9: TGroupBox
        Left = 22
        Top = 132
        Width = 111
        Height = 44
        Caption = 'Shooting Time...! ms '
        TabOrder = 9
        object Edit14: TEdit
          Left = 24
          Top = 17
          Width = 49
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '2000'
        end
      end
      object GroupBox10: TGroupBox
        Left = 78
        Top = 3
        Width = 75
        Height = 42
        Caption = 'Spread Alow'
        Enabled = False
        TabOrder = 10
        object Edit3: TEdit
          Left = 21
          Top = 16
          Width = 30
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = '200'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'View'
      ImageIndex = 2
      object Button2: TButton
        Left = 18
        Top = 10
        Width = 79
        Height = 20
        Caption = 'Test Connection '
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 102
        Top = 10
        Width = 51
        Height = 20
        Caption = 'Strat'
        TabOrder = 1
        OnClick = Button3Click
      end
      object GroupBox7: TGroupBox
        Left = 1
        Top = 36
        Width = 153
        Height = 93
        TabOrder = 2
        object Hunting: TRadioButton
          Left = 4
          Top = 8
          Width = 57
          Height = 17
          Caption = 'Hunting'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object Catching: TRadioButton
          Left = 69
          Top = 8
          Width = 82
          Height = 17
          Caption = 'Catching Up'
          TabOrder = 1
        end
        object CheckBox2: TCheckBox
          Left = 13
          Top = 40
          Width = 48
          Height = 17
          Caption = 'Sell  1'
          TabOrder = 2
        end
        object CheckBox3: TCheckBox
          Left = 13
          Top = 63
          Width = 48
          Height = 17
          Caption = 'Buy 1'
          Enabled = False
          TabOrder = 3
        end
        object CheckBox4: TCheckBox
          Left = 85
          Top = 40
          Width = 52
          Height = 17
          Caption = 'Sell  2'
          Enabled = False
          TabOrder = 4
        end
        object CheckBox5: TCheckBox
          Left = 85
          Top = 63
          Width = 54
          Height = 17
          Caption = 'Buy 2'
          TabOrder = 5
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 135
        Width = 150
        Height = 82
        Caption = '      Ordes Shoting Stats              '
        TabOrder = 3
        object Label11: TLabel
          Left = 15
          Top = 18
          Width = 58
          Height = 13
          Caption = 'Profits ($) : '
        end
        object Label12: TLabel
          Left = 110
          Top = 18
          Width = 24
          Height = 13
          Caption = '2200'
        end
        object Label4: TLabel
          Left = 15
          Top = 37
          Width = 89
          Height = 13
          Caption = 'iSignals Received :'
        end
        object Label14: TLabel
          Left = 110
          Top = 37
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Label9: TLabel
          Left = 15
          Top = 56
          Width = 32
          Height = 13
          Caption = 'Time : '
        end
        object Label10: TLabel
          Left = 110
          Top = 56
          Width = 24
          Height = 13
          Caption = '2200'
        end
      end
      object GroupBox6: TGroupBox
        Left = 3
        Top = 432
        Width = 150
        Height = 57
        Caption = 'Running Time     '
        TabOrder = 4
        object Label21: TLabel
          Left = 15
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object label90: TLabel
          Left = 99
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Label22: TLabel
          Left = 65
          Top = 18
          Width = 49
          Height = 23
          Caption = '/       '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuHighlight
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
      end
      object GroupBox11: TGroupBox
        Left = 4
        Top = 223
        Width = 150
        Height = 122
        Caption = '             Orders Stats            '
        TabOrder = 5
        object Label27: TLabel
          Left = 15
          Top = 42
          Width = 67
          Height = 13
          Caption = 'Profits($) 2  : '
        end
        object Label28: TLabel
          Left = 112
          Top = 42
          Width = 24
          Height = 13
          Caption = '2200'
        end
        object Label39: TLabel
          Left = 15
          Top = 23
          Width = 67
          Height = 13
          Caption = 'Profits($) 1  : '
        end
        object Label40: TLabel
          Left = 112
          Top = 23
          Width = 24
          Height = 13
          Caption = '2200'
        end
        object Label29: TLabel
          Left = 15
          Top = 77
          Width = 100
          Height = 13
          Caption = 'Time For Each Action'
        end
        object Label30: TLabel
          Left = 58
          Top = 96
          Width = 24
          Height = 13
          Caption = '2200'
        end
      end
      object Button4: TButton
        Left = 108
        Top = 416
        Width = 45
        Height = 17
        Caption = 'CloseAll'
        TabOrder = 6
        OnClick = Button4Click
      end
    end
  end
  object Chart1: TChart
    Left = 164
    Top = 0
    Width = 819
    Height = 517
    BackWall.Pen.Visible = False
    Border.Color = clGreen
    Border.EndStyle = esFlat
    BottomWall.Brush.Gradient.EndColor = clSilver
    BottomWall.Brush.Gradient.StartColor = clGray
    BottomWall.Brush.Gradient.Visible = True
    BottomWall.Pen.Color = clGray
    BottomWall.Size = 4
    Gradient.Direction = gdFromTopLeft
    Gradient.EndColor = clWhite
    Gradient.StartColor = clSilver
    Gradient.Visible = True
    LeftWall.Brush.Gradient.EndColor = clSilver
    LeftWall.Brush.Gradient.StartColor = clGray
    LeftWall.Brush.Gradient.Visible = True
    LeftWall.Color = clWhite
    LeftWall.Pen.Color = clGray
    LeftWall.Size = 4
    ScrollMouseButton = mbLeft
    Title.Text.Strings = (
      ' ')
    BottomAxis.Grid.Color = 14540253
    BottomAxis.Grid.SmallDots = True
    BottomAxis.LabelsFormat.Font.Color = clGray
    BottomAxis.LabelsFormat.Font.Height = -9
    BottomAxis.LabelStyle = talValue
    Frame.Visible = False
    LeftAxis.Grid.Color = 14540253
    LeftAxis.LabelsFormat.Font.Color = clGray
    LeftAxis.LabelsFormat.Font.Height = -9
    LeftAxis.LabelStyle = talValue
    Panning.MouseWheel = pmwNone
    View3D = False
    Zoom.Animated = True
    Zoom.MouseButton = mbRight
    Zoom.UpLeftZooms = True
    ZoomWheel = pmwNormal
    Align = alClient
    BevelWidth = 2
    Color = clWhite
    TabOrder = 1
    OnMouseEnter = Chart1MouseEnter
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      33
      15
      33)
    ColorPaletteIndex = 2
    object Label1: TLabel
      Left = 216
      Top = 4
      Width = 81
      Height = 13
      Caption = 'Name Of Chart 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 216
      Top = 23
      Width = 81
      Height = 13
      Caption = 'Neme Of Chart 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8421631
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label33: TLabel
      Left = 152
      Top = 4
      Width = 55
      Height = 13
      Caption = 'Fast Broker'
    end
    object Label34: TLabel
      Left = 152
      Top = 23
      Width = 56
      Height = 13
      Caption = 'Slow Broker'
    end
    object LS: TLabel
      Left = 6
      Top = 498
      Width = 10
      Height = 13
      Caption = '-1'
    end
    object CheckBox1: TCheckBox
      Left = 1062
      Top = 0
      Width = 51
      Height = 17
      Caption = 'Of'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object GroupBox8: TGroupBox
      Left = 752
      Top = 480
      Width = 70
      Height = 51
      Caption = 'Dif Gap'
      TabOrder = 1
      object Chart3: TChart
        Left = 2
        Top = 15
        Width = 66
        Height = 34
        SubTitle.Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          0000EEC973EECE7CEDCE7DEBCD75EECE7DEFD388EED58CEED490F1D794F3D997
          F4DA98F2D795EFD58FF1D691F2D692F1D491F1D592EFD894EDD692F1D896F2D7
          99F3DA9CF3D99EF0D694EDD182EECE76EDCA71EDCC75EFCF7EEECF7DEECC76EE
          CB71EDCE7DF1D68FEFD48DECCF7AF0CD79F1CF81ECD186F4DA98F4DFAAF7E5B8
          F6E1ADF5DD9FF7DB9FF6DB9BF5DC9BF3DA9CF5DBA1F7DEA6F6DFABF4E1AAF8E2
          ABF3DDA6F5DEACF5DFA9F3D894EDD285EED184ECD287F2D996F0D894F0D083ED
          CE7AEECE7EF1D58FEED58DEDD184EFCF78F0CD74EDCE7EF0D693F7E3B0F7E6BC
          F6E1B0F6DFA1F8DCA1F4D998F1D896F6DC9EF8DDA4F7DDA8F6E4B7F6E6BBF6E5
          B3F4E0AAF5DFADF4DFA8F2D896EED388EFD58CF2D895F5DE9FF0D894EECE81EE
          CD7EEFD082F1D48AF0D58BEDD082EBCD76ECCA71F1D388F3DA98F6DFA7F9E3AC
          F9E0AAF6DE9FF2D795F2D794F4DA9CF8DDA6F5DCA1F6DC9FF8E5B3F7E7BCF6E5
          B9F7E7B4F6E1AEF7DEA5F2D795F0D385F0D389F5DB99F5DDA2F3D997F0D083ED
          CD7CEFD289EDCE81EECF81EECF7DEDCE74EECD71EBD182F1DA97F7DFA8F5E0A8
          F7E0ACF1DCA1F4DB99EFD692F5DDA6F7E0B0F3DDA3F4DA99F4E0AAF7E7B8F8E8
          B9F4E6B5F5E3B4F5DFA9F4DA9AF1D38AEFD081EED28AF1D898F1D794EED389EF
          D288EED68DEFD080EDCE7CF0CE7CEDC96BEFC868F0CF7FF3DA97F6DDA7F3DEA5
          F5E1ADF8E4B2F7DFAAF5DDA7F8DFAAF7DEA8F4DD9CF3DA98F6E2ABF7E7B6F5E4
          B2F5E2AEF5DEA9F5DB9FF2D795F2D58BEFCF7AEED282F0D892F3DB97EDD790EF
          D593EDD58AEFCF7EEFCD75F0CA74EBC55EEBC561EDCC78EFD28AF6DA9DF4DB9D
          F6E0A8F9E6B8F5E5B8F6E6BBF7E6B4F5E0ABF6DEA6F8DFA6F6E0A8F7E2ABF6DE
          A8F5DDA4F3DC9DF1D796EFD591EDD48AF1CD7AEDCD7AF1D792F4DA9DF0D895F1
          D694F0D07EEEC768EDC15BEBC057E7BE52EAC159EFC668EDCD78F0D288F1D68F
          F6DEA2F7E3B1F7E8BDF7E7BFF4E6B8F6E6B7F7E4B3F8E0ADF4DC9CF4DB98F5DE
          A2F6E0A7F3DB9FF6DB9CF7DEA0F0D794EFD185EED384F2D792F7DDA3F5DC9DF1
          D792EECA6DE9BE4DE5B63DE7BB47E8BC4FE8BE54ECC35EF1C969EECA71F1D080
          F5D794F5DFA6F7E5B9F5E6B9F5E9BFF7E6BDF4E0ABF6DEA7F4DA9CEFD891F1D8
          96F5DC9BF4DB9DF4DCA4F7DDA1F2DA97F1D897F0D794EFD792F3DDA3F3DDA0EF
          D591F0C662E8BA47E5B83EE5BC47E7BE50EEC15BEDC461EEC566EFCC71EECD78
          EFD185F5DCA0F7E5B5F7E8BDF8E8C1F8E6B6F6E0AAF4DDA2F1D896F1D691F0D6
          8FEED38CF2D796F5DCA0F4DB9EF6DC9FF8DEA6F4DCA0F3DB9CF7DFACF6DDA8EF
          D38BEFC562E7BE51E8BD4DE8BD50ECC159EEC35EEFC765EEC867F0CD72F2CF7B
          F0CF82F3D995F7E3AFF6E8BFF6E5BCF6E0A8F7DDA4F4DB9EF1D795F1D691EFD5
          8BEFD58BF1D691F4D898F6DCA2F8E0A9F6DEADF5DEA7F4DDA1F7E0A8F5DDA4F1
          D487EDC769EDC55EE9BE57E7BD53E8BF53EAC057ECC45EEDC869EECC71EDCC74
          EED07EF5DC99F7E0ABF7E7BBF5E2AFF3D99AF5DB9DF6DB9CF3D996F2D793F1D8
          90F0D78EF0D690F1D695F6DEA7F5E7BEF6E6BCF7E2AFF8DFA6F4DEA8F6DFA8F0
          D58EEDCF7AEFC96BF0C567EAC25BE7BF51E9BD52EBC25AF1CB70F0CE74ECCE75
          EFD388F6DCA6F8E2ACF8E4B3F5DD9FF0D590F1D998F2D896F0D68FF1D594F2D7
          93F0D590F2D695F6DB9EF4DEAAF6E6B9F5E9BEF5E1B2F8DFAAF5E3B0F5E0ACF0
          D899EED486EFCF7CEECB73EEC86AECC25AECC35BEEC766EFCC75F1D185EFD48D
          F4DA98F7DEA5F6E1ACF7E1ABF4D795EDD589EED68FF1D48DEFD183F0D286F1D3
          88F2D58DF2D79AF4DEAAF7E2ADF4E2B0F5E4B7F7E5B6F8E5B6F7E7BAF7E0ACF6
          DC9BF3DA9AF1D797F1D694F0D187EFCE79ECC96EEEC96FEFCE7CF1D58DF5DB9C
          F6DDA1F3DFA4F8E0A9F7DEA6F2D693EDD384F0D384F0D07EECCB72EDCD74EECD
          78EFCF7EF2D48DF3D99CF6DFA7F7E2ADF8E2ADF7E3B1FAE7BAF6E7B9F7E0ACFA
          DEA1F5E0ADF4E1B1F6E1ADF4DA9BF2D591EDD181EFCD7AEECE7EEFCE7FF1D58E
          F6DC9DF2DDA4F5DDA0F4DA9AEFD38DEED080F0CE76EEC970ECC970EECD78F1CB
          73EFC869F0CE79F0D58BF2D99AF4DDA5F6DEA7F4DDA6F7E2ADF8E4B1F7E1ADF5
          DDA5F6E6B4F8E7BFF7E6B9F4E0A7F5DBA1F2D896EDD083EECE79F0CC72ECCC79
          EED284EED790F1D896F2D691F0D187EFCC79EEC769EBC25FEDC767EFCB6EEFC7
          6DEDC562EDC86BEECF80EFD690F3DA9BF4DA9CF3DA9CF5DEA4F7DEA7F7DEA7F5
          DDA7F4E3B0F6E7C3F8E9C2F4E5B4F7E3B0F5DDA5EFD58DEFCB73EEC665EFCC72
          EFCE7CF2D68EEED38BEFD286F0CE78ECC765E9C155EABE53EBC158EDC25DEFC5
          66F0C663EDC565F0CD79F0D488F0D48CEFD38AF0D693F4DCA2F9DFA6F5DBA0F5
          DBA5F8E3B3F7EACAFAECCBF6E6BDF7E5B4F5DDA6F2D792F0D184EECA72EECA6D
          EFCB71EECC79F0D080EFCF7AEDC463EABF55E8BD4DEABD50E6BB47E9BD4FECC1
          5AEFC563EEC669EECB75EED081EED082EFD184F2D797F9E1AEF5DDA3F4DA9BF5
          DB9FF8E7BEF9F1D7FBEED3F7E4BBF8E0ADF8E2AEF3DA98EFD690ECD58EEFD384
          EECD7AECC869EDC669ECC664E8BD4DE7B945E9B944E7B944E7BB42E9BD4BE8BE
          54EDC45FEDC666EECB71EECD7AEFD388EFD791F5DC9FF7DEAAF3DBA1F4D99BF6
          DCA2F4E9BDFBEED1F9EBC9F6E5B7F8E2ABF9DFA6F6DD9FF3D898F7DDA5F8DC9E
          EED083EEC666EBC159EBBE52E8B63BEAB632E8B536E9B942E7BB4BE6BA47EBBF
          52EEC25CEFC767EECC76F0D17EF1D68EEFD893F4DA9BF5DBA1F5DCA3F1DA99F4
          DCA8F6E3B0F5E4B3F9E7BCF8E6B8F6E3AFF2D89DF6DCA2F7DDA8F7E2AFF3DA9D
          EDCF82EEC565EBC159E6BB49E7B433E8B22FE6B73DE7BC4BE7BB4BE6B946E9BD
          50EDC35DEFC96CEFD07EF0D58CF3D894F2D68FF0D38AF2D58EF6DC9DF4DDA4F7
          DEA8F4DEA0F4DEA5F8E4B4F8E6B7F4E1AEF6DFA8F6E0ABF6E3B0F8E5B6F2DDA3
          EFD389EFC769EBC259E6BA47E7B434E7B12EE7B943E6BD50E4BB4BE6BC47E7BD
          4FECC25BEBC465F0CF7BF0D68FF2D896EFD185EBCC7AEECF7EF0D790F1DAA2F7
          DDA3F3D999F5DFA9F7E3B5F8E6BBF7E7BEF8EBC7F6E8BEF5E3B0F6E0AFF3DEA2
          F0D48BEFCA70EAC359E8BD49E6B940E8B63DE7BB4CE4BC4CE3BC48E6B941E7BB
          46EABF51ECC35EEFC76BEECF7CF0D389F0CF81EDCC76EECB6FEFCD77F2D388F1
          D693F5D89BF7E2AFF8E5BAF7E7C1F9EDCFF9EED2F8E8C0F8E2B1F7DFAAF0D897
          EFD489F0CF78EFC86AEDC25CE6BB4DE9BE50EAC15CEABF57E9BF53E9BE50E4BC
          4BE5BD4FEDC35DF1C661F0CA6CEFCB75EFCB72F0CD74F1CC72F0CB70EECD77EE
          D286F1D68FF5DFA9F9E9C1F5EBC5FAF0D4F8EFD1F7E8BDF5E0ABF2DA9FEFD693
          EFD488EED07AEDCE79EFCB75ECC35DECC25BEEC561EEC667EEC361EDC55EE7BF
          52E6BD4FE9C157EAC258ECC35EEDC460EDC668F0CD74EFCD77EEC76BEFC668F0
          CC77EED07FF1D897F6E2AEF9EAC5F9F1D4FAF1D4F8E8BEF5DFA4F0D795F1D58C
          F0D083EED07FEDD07FEECE78EFCA70EEC566F0C563EEC668F0C564EDC461EAC1
          57E7BD51E9C157E7BE54E7BD51E7BD51E9C058EBC460EAC663EBC157E9BE52ED
          C565ECC96EF0D489F3DA9BF7E2B7F4EBC7FBF2D6F6E4B6F2DA9BF2D794F0D38D
          EFD083F0CE78F0CF7EEFCD79F0CC72F0CA6DEAC056E9BC4DE8BE4FEABF57EEC4
          5DEAC058EDC258ECC157E7BC4EE8BD52E9BD52E7BD4FE6BD4EE7B843E5B944E9
          C257EDC96CF0D387F2D895F4DDA4F7E6BAF9EDCBF7E5B6F3D99DF1D692F0D58B
          F3D68AEDCF7DEFCF7EECD287F0CD7CEDC763E7BE4DE8B945E8BA42E8BC4FEBC3
          59EDC55DEBC25BEBC25BE9BF59EDC35CE7BD54E7BB4BE6BA42E4B639E6BA43EA
          C359EDC86CEFD284F0D68DEFD890F8E1AFF7E6BFF7E3B3F5DCA2EFD48DEDD181
          EED184ECD286F0D790F1D58BEECA6FEBC459E9BF55E5BC4FE5BA46E7BC4DE8C0
          54EDC55DECC461F0C866F0C569EEC461EDC35EEBBE4EE7B73CE7B940E9BD50EB
          C35DF1C86DEECC78ECCF7DECD285F3DB9DF7E0ACF3DCA1F1D898EED187EDCE79
          EECE7AF1D386EFD68EF1D285EECA6FEAC561ECC563EBC35BEBC055E9C053E8BE
          55EAC460ECCA6BF0CC72EEC567EDC35BEFC562ECC055E7B946E9BD4CECC25AED
          C460F0C567F1C86CF2CE74F0CF82EED284F2D48DEFD58EEED48BEFD083F1D180
          EED284EFD48DEED68AEFD084F0CF7DEECF77F0D080EED07DEECD78EECD71EDCC
          72EFCE7BEFD183EDCD82F2C96DEEC35FEDC35CEAC15AECC25CEEC360EFC362ED
          C362}
        Title.Picture.Data = {
          07544269746D6170360C0000424D360C00000000000036000000280000002000
          0000200000000100180000000000000C00000000000000000000000000000000
          00000B37E40940F0023EDF023BCA0335C10031C20236D00137DD0039E90643FA
          004BF80151F9005AFA0062F9006AFA0070FB007FF60184FA0489FE0287FC0081
          F9007AF60075FA0062F80153FC024FFE0050FA0057F60059F5033CDE0725A601
          115E043ADF0342EA033EDD053CCF033ACE0036D1023DE1013EEE003EF50346FD
          0056FA015BFB0160FC0065FB006AFB006EFD017BF80183FA028CFC038FFD018A
          FB0184F8007AFB006AFB015DFD0058FB0064F50379F80570F9013BE2092BB503
          1D790041DE0044F1013CEC0637E50438E30035E20140F00247F6024AF90855FE
          0363FE0466FE0468FE0269FE026BFE036EFE057AFD0280FA0189FA0292FC0492
          FE0590FE0281FE0272FE0363FD0061F50278F20E9AFB0D81F6023DE00F33C00A
          2C930644EF024AF60244EB0138DF003AE6013FF40143FE0049FE0151FC055CFA
          046DF9036FFC0473FE0275FF0076FE0177FE007EFB0280FD0483FC048BFA0597
          FA06A0FA0793F80079F6085CFF0865F6058FE41497FD045AF60547F0043BDD01
          2FBC0747F2014AF70243EF023AE8003DF00242F90547FE044BFE024EF80152F3
          0866FE066CFE0375FE027CFE017CFE007AFE007FFB0281FD0483FD0489FB0493
          F9059BFA0C9BFA0081F40763FE0C6BFB048EEB0B88FA0254F60447F3053DE503
          34C9074AF6004AF70042F2023CF2003FF60546FC0A49FA0646F00245E50047E3
          0856FE0663FD0173F9017FFB0282FE007EFE0082FC0282FD0481FD0384FA038C
          F90394FA10A4FC008EF3056CFA0B6FFD048CF30578F5004FF60547F80740EF04
          39D8064DFA004AF60044F4013DF60345F60D4AF20D41DD0231C2002DB70033BD
          0341E30556F00168F60078FB0382FF0683FF0185FB0383FD037FFD027EFA0083
          FA018AFB0FA6FD009DF50479F5056DFB0486F60770F5004FF70649FC0542F700
          3CE4044EFC004EF7014AF70343F70645E90A40D50530B1002095001E8F022597
          0234C0074DE1015BF50067FC0278FF0780FD0186FC0383FD037EFD017BFB007D
          FA0082FB049DFD03A8F90987F8026DF70581F50C71F70251F7054AFB0343F700
          3FEA034EFC0052F90451FB0648F6033DD2012CB0001E8C021A7B071E7C092283
          032FA70A48D70251F80059FE016CFE067AF80187FB0384FD037DFD0178FB0079
          FA007DFB0091FB07AEFB1095FC0270F5067DF31073F80352F4034AF90144F700
          42ED0B54F80159FA045AFC0A4EEB062CA4001A82061D8000187E011A800B2484
          0531B00543DF014DFC0053FD025EFB0267FE0680F70681FD017CFF0071FB0072
          FA0679FE0289F40AACFE06A6FB017CF10A76FA0C7BF20057EF014AF60145FB00
          43F90754F8005BF9075FFB0D50E5042290001679081F80011D86021F8A09258B
          012DAF0240DD004CFB0052FB015BF80061FA0171F70278FB027BFC0076F80071
          FB0371FE0182F607A7FD07AAFB048BFA0474F70D7FF9045DF3044AF40243F900
          42F80355F8005EF90A62FA0E4EDC021B7D0316730B2485022393012398042494
          012DB20140DE004DFB0053FB0158F8005BF8005EFA006BF90377F80279F80171
          FC0069FF0177F60BA7FE06B0FA0599FD0078F60A7EFA0864F4074EF20442F500
          40F6015BFC0061FA0860F60A46D1031E7C051C790A29910128A20027A600249D
          0230B90242E1004EFC0255FD0358FA0058F90054FE005FFA026CF80675FC0571
          FE0369FF026BF80EA5FF06B8F802A4F80385FA067CF7076DF70754F00542F002
          3FF30160FE0063FD055AF2043BC9062487062385072D9D002CAF002CB20228A7
          0534C00143E4004EFA0255FC0458FB0056FC0353FE0055F9005DF9036AFE066E
          FF046BFD0265FB0697F807BEF801ACF6058EFB047DF80576F9055AF10442ED04
          3DF10265FF0064FD0254EE0132C2042990052790052FA70030B90231BD042DB0
          0435C40243E4004DF80253FB0456FB0154FD0554FC004EF80050FA005DFE0468
          FD056DF90762FA0184EA08C0FA04B5F90390F90781FA037EFB0261F10445EC04
          3DEE026AFF036AFA034FDF022FB8022993052A970230AF0035C90033CB022EC0
          0033CD0543E30751F80353FF0052FE0253FD0252FA004BF7004AF9004EF90159
          F80869FD095EFD0279F60DAEFD04B4F90090F10580FC0280FA0274F60059EB00
          43E3026AFF0269F9014DDF012FBD032E9F072FA10534B60238D00236D30431C9
          0035D10444E40551F80254FE0152FD0352FD0050F9004BFA014AFB004BF70154
          F50865FB095EFC0173F20AA4FB04ABFA0089F30374FC017BFA0678FC0562F200
          46E2036BFE0167F9004CE20030C60334B10733AF0737C1033BD9033ADE0536D5
          0037D80144E80351F70255FE0151FD014FFC004CF8014AFC0449FE0046F6004C
          F1085DF70A5FFC006CF20794FB069CFD007EF80066FA006AF50773FD0B6AFA02
          50E7026AFD0066F9004DE90235D40138C20536BC0738C9033CDF023BE70438E0
          0039E20144EB0251F60156FD0151FD014DFB0048F90248FD0546FF0041F60045
          EE0553F10C61FC0067F30584FB0689FE0471FC0359FB0054F10261F80868FD05
          5DF2016AFA0065F70351EF073CE2003BD00439C60639CF043DE5023DEE0339E9
          003BE90045EF0052F60156FC0151FC004AFB0048FB0144FD0442FE023FF70041
          ED024AEC0C60FB0063F30377FB0377FC0363FB0550FB0248F6004DF3025CF907
          62F90168F80063F90553F50942ED003FDB043BD1063BD7033FEB013FF4033CF1
          003DEE0046F10052F70156FC0151FC0049FA0047FC0042FC0240FC033FF60040
          EC0045E80A5EF9005FF4006BF90068F90257F80648FB0843FB0040F1004DF306
          5EFC0062FC0360FF0152FB0045F30142E8003DE4003CE80041F10043F50040F5
          0040F30048F60350FB0455FE024FFC0047F80041F90040F90040F60140EE003F
          E50040DE0954F20158FC005AFF0256FA0449F1003FF50039F1003BF3003FF604
          49FB0061FC0160FF0154FB0047F30245EC0040EA0040ED0145F50246F80044F9
          0041F50047F60250FB0453FE024EFC0046F9003FF8003EF6003DF4003CEA003C
          E1003CD9074FF00153FC0053FF014EF40344EB003AEE0137E7003AEA003CEF01
          44F40060FB0160FE0158FC004AF50345F10043F00044F20248F70248FA0248FA
          0043F70048F7014EFA0451FD024BFC0044F8003EF7003CF5003BF0003AE7003A
          DB0039D3054BEC024FFB004BFB0242EB053CE10136E10132D60034D70035DD00
          39E4005EFA0160FD015BFD004CF50043F30044F30045F50147F80149FA0049FA
          0044FA0048FA004DFA024EFC0248FC0042F9003DF9003CF6013AEF0239E30338
          D60238CD0648E6054DF90145F6033AE00737D50233D20332C90130C70031CB00
          33D4005DF90160FD025DFE004FF60043F50045F70147F90048F9004AFA004AFB
          0045FC0048FB004CFB014CFC0247FB013FF8003CF8003AF50138ED0336DF0335
          D10235C70447E0064BF30140EE0232D50832C70231C30432BF002CB8002BBA01
          2EC4005AF9015FFB0460FE004FF60043F80246FA0249FB014AFB004CFB014CFC
          0047FD0049FB004BFC024BFD0245FB003EF80038F60038F30035EA0133DB0132
          CC0131C20143D60649F0013BE3032DC5092CBA022DB8022CB60125AC0123AA00
          26B20056FD035EFA0A64FE004EF20143F60146F7014AF9004DF9004EF9004EFA
          004BFB004AFB0149FD0447FF0242FD003CFA0034F30237F20235E80132D60133
          C70032B9023DC20844F00036D1092CAA0E21AE0526B20325AE0627A90426A200
          229D0056FD045FFB0A66FF004EF30143F60146F7014AF9014DFA004FFA004FFA
          004CFC004AFB0148FD0346FE0241FD003CF90032F10235EF0131E3002FD00031
          C1002EB20237BB0A40EA0030C90525A00B1CA40423A90124A50325A101239A00
          1F970056FD0461FC0B66FF004EF30143F60146F7014BFA024EFB0150FB0151FC
          004EFD004BFB0048FC0344FD023FFB003AF80033F00234EB0130DD022ECA032F
          B8002AA8022DAB0E3CDE012BBD021D9007189803219F00219B002197001F9200
          1C8E0053FB045FFB0A66FF004FF40143F60146F7024BFA024FFB0251FC0252FD
          0050FE004BFC0047FB0243FB023DFA0138F60335EF0433E8032ED9052DC5062E
          B101279E0323931137CD0328B101198509169304209D002096001E92001B8E00
          198B0051F9035DF90965FE0050F40143F60146F8024BFA0350FC0352FD0253FE
          0051FE004CFC0047FA0141FA023BF80237F60434EE0431E5022CD3052BBE072A
          AA0123950217791031BB0425A502157F0A1391051D9E001F96001C9201198F02
          178C}
        Title.Text.Strings = (
          'Dif Gaps')
        Align = alClient
        TabOrder = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series3: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
        object Series4: TLineSeries
          Brush.BackColor = clDefault
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
        end
      end
    end
    object Panel2: TPanel
      Left = 896
      Top = 359
      Width = 62
      Height = 17
      Caption = 'Gap Lines'
      Color = clHotLight
      ParentBackground = False
      TabOrder = 2
    end
    object ss: TPanel
      Left = 824
      Top = 359
      Width = 66
      Height = 18
      Caption = 'Dif Gaps'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 752
      Top = 492
      Width = 68
      Height = 25
      Caption = 'Dif Gaps'
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 4
      OnMouseEnter = Panel1MouseEnter
    end
    object Series1: TLineSeries
      SeriesColor = 16713986
      Brush.BackColor = clDefault
      LinePen.Style = psDot
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      SeriesColor = 244
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 828
    Top = 136
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 868
    Top = 136
  end
  object C1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'localhost'
    Port = 27401
    OnRead = C1Read
    Left = 824
    Top = 192
  end
  object C2: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = 'localhost'
    Port = 27501
    OnRead = C2Read
    Left = 856
    Top = 192
  end
end
