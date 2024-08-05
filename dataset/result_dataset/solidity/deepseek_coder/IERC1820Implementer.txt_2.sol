csharp
using System;
using System.Collections.Generic;
class Program
{
    static void Main(string[] args)
    {
        List<string> stressReductionMethods = new List<string>();
        stressReductionMethods.Add("1. Exercise regularly");
        stressReductionMethods.Add("2. Practice mindfulness meditation");
        stressReductionMethods.Add("3. Take a walk outside");
        stressReductionMethods.Add("4. Write down your thoughts");
        stressReductionMethods.Add("5. Get a good night's sleep");
        stressReductionMethods.Add("6. Listen to calming music");
        stressReductionMethods.Add("7. Set reminders for important events");
        stressReductionMethods.Add("8. Get enough sleep");
        stressReductionMethods.Add("9. Practice deep breathing exercises");
        stressReductionMethods.Add("10. Take a walk in nature");
        Console.WriteLine("Stress Reduction Methods:");
        Console.WriteLine("--------------------------");
        for (int i = 0; i < stressReductionMethods.Count; i++)
        {
            Console.WriteLine((i + 1) + ". " + stressReductionMethods[i]);
        }
    }
}