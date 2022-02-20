using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace RuleGenerator
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public List<Rule> Rules { get; set; } = new List<Rule>();



        public MainWindow()
        {
            InitializeComponent();


        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            AddRule();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            string RuleString = string.Empty;
            foreach (var r in Rules)
            {
                RuleString += $@"{{
    [""name""] = ""{(string.IsNullOrEmpty(r.RuleName) ? r.GenerateName() : r.RuleName)}"",
    [""formula""] = ""{r.Formula}"",
    [""order""] = {r.Order},
    [""enabled""] = true,
    [""used""] = true,
    [""damaged""] = false,
}},{Environment.NewLine}";
            }

            File.WriteAllText($@"{AppDomain.CurrentDomain.BaseDirectory}\Rules.txt", RuleString);
        }

        private void Load_Click(object sender, RoutedEventArgs e)
        {
            Rules.Clear();
            RulesPanel.Children.Clear();

            string RuleString = File.ReadAllText($@"{AppDomain.CurrentDomain.BaseDirectory}\Rules.txt");
            string[] RulesRaw = RuleString.Split("},");
            foreach (var rr in RulesRaw)
            {
                if (!rr.Contains('='))
                    continue;

                List<EStatType> CheckedTypes = new List<EStatType>();
                int Order = 0;

                string[] RuleLines = rr.Split('\n');
                foreach (var l in RuleLines)
                {
                    if (!l.Contains('='))
                        continue;

                    string Value = l.Split('=')[1].Replace(",", "").Trim();

                    if (l.Trim().StartsWith("[\"name\"] ="))
                    {
                        string[] NameSplit = Value.Split(' ');
                        foreach (var ns in NameSplit)
                        {
                            if (ns.Contains('/'))
                            {
                                string[] StatSplit = ns.Split('/');
                                foreach (var ss in StatSplit)
                                {
                                    if (Enum.TryParse<EStatType>(ss.Replace("\"", "").Replace(",", ""), out var st))
                                        CheckedTypes.Add(st);
                                }
                            }
                            else
                            {
                                if (Enum.TryParse<EStatType>(ns.Replace("\"", "").Replace(",", ""), out var st))
                                    CheckedTypes.Add(st);
                            }
                        }
                    }

                    if (l.Trim().StartsWith("[\"order\"] ="))
                        Order = int.Parse(Value);
                }

                AddRule("", Order, CheckedTypes);
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void AddRule() => AddRule("", 95, new List<EStatType>());
        private void AddRule(string InName, int InOrder, List<EStatType> InCheckedTypes)
        {
            RulesPanel.Children.Add(new Separator() { Margin = new Thickness(0, 5, 0, 5) });
            Rule NewRule = new Rule(InName, InOrder, InCheckedTypes);
            Rules.Add(NewRule);
            RulesPanel.Children.Add(NewRule);
        }
    }
}
