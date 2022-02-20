using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Media;
using System.Windows.Shapes;

namespace RuleGenerator
{
    public class Rule : StackPanel
    {
        public List<CheckBox> StatBoxes { get; set; } = new List<CheckBox>();

        public string RuleName { get; set; } = string.Empty;
        public int Order { get; set; } = 100;
        public string Formula 
        { 
            get 
            {
                string Final = "";
                List<CheckBox> OrderedStatBoxes = StatBoxes.OrderBy(o => !o.IsChecked).ToList();
                for (int i = 0; i < OrderedStatBoxes.Count; i++)
                {
                    CheckBox s = OrderedStatBoxes[i];
                    Enum.TryParse<EStatType>(s.Name, true, out var t);

                    if (i == 0)
                    {
                        Final = t.GetStatDisplayInfo();
                    }
                    else
                    {
                        Final += $" and{(s.IsChecked.GetValueOrDefault() ? " " : " not ")}{t.GetStatDisplayInfo()}";
                    }
                }

                return Final;
            } 
        }



        public Rule(string InName, int InOrder, List<EStatType> InCheckedTypes)
        {
            Random rnd = new Random(DateTime.Now.Millisecond);
            Color RandCol = Color.FromRgb((byte)Math.Max(100, rnd.Next(256)), (byte)Math.Max(100, rnd.Next(256)), (byte)Math.Max(100, rnd.Next(256)));
            Background = new SolidColorBrush(RandCol);



            RuleName = InName;
            Order = InOrder;

            StackPanel InfoPanel = new StackPanel();
            InfoPanel.Orientation = Orientation.Horizontal;

            TextBox NameText = new TextBox() { Background = new SolidColorBrush(Color.FromRgb((byte)Math.Min(255, RandCol.R + 50), (byte)Math.Min(255, RandCol.G + 50), (byte)Math.Min(255, RandCol.B + 50))) };
            TextBox OrderText = new TextBox() { Background = new SolidColorBrush(Color.FromRgb((byte)Math.Min(255, RandCol.R + 50), (byte)Math.Min(255, RandCol.G + 50), (byte)Math.Min(255, RandCol.B + 50))) };
            InfoPanel.Children.Add(NameText);
            InfoPanel.Children.Add(new Separator()
            {
                LayoutTransform = new RotateTransform(90d),
                Margin = new Thickness(10, 0, 10, 0),
            });
            InfoPanel.Children.Add(OrderText);

            Binding NameBind = new Binding()
            {
                Source = this,
                Path = new PropertyPath("RuleName"),
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged
            };
            BindingOperations.SetBinding(NameText, TextBox.TextProperty, NameBind);

            Binding OrderBind = new Binding()
            {
                Source = this,
                Path = new PropertyPath("Order"),
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged
            };
            BindingOperations.SetBinding(OrderText, TextBox.TextProperty, OrderBind);

            //InfoPanel.Children.Add(new Separator()
            //{
            //    LayoutTransform = new RotateTransform(90d),
            //    Margin = new Thickness(10, 0, 10, 0),
            //});

            //Button RemoveButton = new Button()
            //{
            //    Name = $"i{Children.Count}",
            //    Content = "  -  "
            //};
            //RemoveButton.Click += (s, e) => 
            //{
            //    int Index = int.Parse(RemoveButton.Name.Remove(0, 1));
            //    Children.RemoveAt(Index);
            //    Children.RemoveAt(Index);
            //};
            //InfoPanel.Children.Add(RemoveButton);



            StackPanel StatPanel = new StackPanel();
            StatPanel.Orientation = Orientation.Horizontal;

            string[] StatTypes = Enum.GetNames(typeof(EStatType));
            for (int i = 0; i < StatTypes.Length; i++)
            {
                string t = StatTypes[i];

                if (i > 0)
                {
                    StatPanel.Children.Add(new Separator()
                    {
                        LayoutTransform = new RotateTransform(90d),
                        Margin = new Thickness(10, 0, 10, 0),
                    });
                }

                Enum.TryParse<EStatType>(t, true, out var st);
                CheckBox StatBox = new CheckBox()
                {
                    Name = t,
                    Content = t,
                    Margin = i == 0 ? new Thickness(30, 0, 0, 0) : (i == StatTypes.Length - 1 ? new Thickness(0, 0, 30, 0) : new Thickness(0, 0, 0, 0)),
                    IsChecked = InCheckedTypes.Contains(st),
                };

                StatBoxes.Add(StatBox);
                StatPanel.Children.Add(StatBox);
            }

            Children.Add(InfoPanel);
            Children.Add(StatPanel);
        }

        public string GenerateName()
        {
            string Final = "";
            List<CheckBox> CheckedStatBoxes = StatBoxes.Where(o => o.IsChecked.GetValueOrDefault()).ToList();
            if (CheckedStatBoxes.Count == 1)
            {
                Final = $"Pure {CheckedStatBoxes[0].Name} Gear";
            }
            else
            {
                for (int i = 0; i < CheckedStatBoxes.Count; i++)
                {
                    CheckBox s = CheckedStatBoxes[i];
                    if (i == 0)
                    {
                        Final = s.Name;
                    }
                    else if (i == CheckedStatBoxes.Count - 1)
                    {
                        Final += $"/{s.Name} Gear";
                    }
                    else
                    {
                        Final += $"/{s.Name}";
                    }
                }
            }

            return Final;
        }
    }
}
