using System;
using System.Collections.Generic;
using System.Net;
using Idfy;
using Idfy.Identification;
using Newtonsoft.Json;

namespace DoggoApp
{
    class Program
    {
        static void Main(string[] args)
        {
            PrintDoggos();
        }

        static void PrintDoggos()
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine(@"
            _     /)---(\          /~~~\
            \\   (/ . . \)        /  .. \
             \\__)-\(*)/         (_,\  |_)
             \_       (_         /   \@/    /^^^\
             (___/-(____) _     /      \   / . . \
                          \\   /  `    |   V\ Y /V
                           \\/  \   | _\    / - \
               woof woof    \   /__'|| \\_  |    \
                             \_____)|_).\_).||(__V

            ");
            Console.ResetColor();
        }
    }
}