module mydll;
 
 import std.stdio;
 import std.file;
import std.string;
 
public struct Struct1
{
	protected int a;
	protected ulong b;
	protected immutable(char)* c;
}
public struct Struct2
{
	protected int a;
	protected ulong b;
	//protected immutable(char)* c;
}
 export extern(C) void dllprint(ref int a,ulong b,immutable(char)* str,out wchar* strref,Struct1 struct1,ref Struct2 struct2) //
 { 
	 writeln("-------hello dll world,from D to C#!-------");
	 auto f = File("test.txt", "w");
	 f.writeln("执行D的dll后的结果：");
	 f.writeln("传入D的int值：",a);
	 f.writeln("传入D的ulong,string 值：",b,",",fromStringz(str));
	
	 f.writeln("传入D的结构的值：",struct1.a,",",struct1.b,",",fromStringz(struct1.c));

	 f.writeln("---------from D to C#---------------");

	 a=10;
	 f.writeln("准备传入C#的int值：",a);

	 struct2.a =4;
	 struct2.b = 7000;
	 f.writeln("准备传入C#的结构的int值：",struct2.a);
	 f.writeln("准备传入C#的结构的int值：",struct2.b);
	 
     f.writeln("准备传入C#的字符串：","aaa");
	 strref = cast(wchar*)"aaa";
	 f.writeln("------------------------");
	 f.writeln("传入D的结构：",struct1);
	 // struct2.c = toStringz("struct2_2");
 }
