using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RuleGenerator
{
    public static class StatTypes
    {
        public static string GetStatDisplayInfo(this EStatType InStatType)
        {
            switch (InStatType)
            {
                case EStatType.Stamina:
                    return "tooltip(\"%+%d+ stamina\")";
                case EStatType.Strength:
                    return "tooltip(\"%+%d+ strength\")";
                case EStatType.Agility:
                    return "tooltip(\"%+%d+ agility\")";
                case EStatType.Intellect:
                    return "tooltip(\"%+%d+ intellect\")";
                case EStatType.Spirit:
                    return "tooltip(\"%+%d+ spirit\")";
                case EStatType.SpellPower:
                    return "tooltip(\"%+%d+ spell power\", \"increases spell power by %d+\")";
                case EStatType.AttackPower:
                    return "tooltip(\"%+%d+ attack power\", \"increases attack power by %d+\")";
            }

            return "";
        }
    }

    public enum EStatType
    {
        Stamina,
        Strength,
        Agility,
        Intellect,
        Spirit,
        SpellPower,
        AttackPower
    }
}
