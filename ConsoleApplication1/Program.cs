using System;
using System.Runtime.InteropServices;
namespace ConsoleApplication1
{
    class Program
    {
      public struct Struct1
        {
           internal int a;
           internal ulong b;
           internal string c;
        }
        public struct Struct2
        {
            internal int a;
            internal ulong b;
            //internal string c;
        }
        [DllImport("TestCsharp_D.dll")]
        public static extern void dllprint(ref int a,ulong b,string str,out IntPtr strRef, Struct1 struct1,ref Struct2 struct2);
        static void Main(string[] args)//[MarshalAs(UnmanagedType.LPWStr)] 
        {
            int a = -1;
            ulong b = 10101;
            string pp = "HElLo";
            IntPtr strref = (IntPtr)0;

            Struct1 struct1;
            Struct2 struct2;
            struct1.a = 2;
            struct1.b = 50000;
            struct1.c ="struct1_1";

            struct2.a = 3;
            struct2.b = 60000;
            // struct2.c = "struct2_2";
            Console.WriteLine("准备传入D的int值：{0}",a);
            Console.WriteLine("准备传入D的ulong,string 值：{0},{1}", b, pp);
            Console.WriteLine("准备传入D的结构的值：{0},{1},{2}", struct1.a, struct1.b, struct1.c);
            Console.WriteLine();
            
            dllprint(ref  a, b, pp,out strref, struct1, ref struct2);
            Console.WriteLine();
           
            Console.WriteLine("传入C#的int值：{0}",a);
            Console.WriteLine("传入C#的结构中的int值：{0}", struct2.a);
            Console.WriteLine("传入C#的结构中的ulong值：{0}", struct2.b);
            Console.WriteLine("传入C#的字符串：{0}", Marshal.PtrToStringAuto(strref));
            Console.WriteLine("--------------------------");
            Console.WriteLine("传入C#的结构：{0}", struct2);

            //Marshal.FreeCoTaskMem(strref);//不需要，D自动Free
            Console.Read();
        }
    }
}
