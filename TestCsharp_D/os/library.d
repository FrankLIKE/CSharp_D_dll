//  os/library.d 
module os.library;

extern (C){
   void  gc_init();
   void  gc_term();
  version(Windows)  void  _minit();
   void  _moduleCtor();
   void  _moduleDtor();
   //void  _moduleUnitTests();
  version(linux)  void  _STI_monitor_staticctor();
  version(linux)  void  _STI_critical_init();
  version(linux)  void  _STD_monitor_staticdtor();
  version(linux)  void  _STD_critical_term();
}

extern (C)
void  d_init()
{
   //  writefln("Start init D runtime"); 
  version(linux) _STI_monitor_staticctor();
  version(linux) _STI_critical_init();
  gc_init();
  version(Windows) _minit();
  _moduleCtor();
  //_moduleUnitTests();
   //  writefln("init finished"); 
}

extern (C)
void  d_fini()
{
   //  writefln("Start term D runtime"); 
  _moduleDtor();
  gc_term();
  version(linux) _STD_critical_term();
  version(linux) _STD_monitor_staticdtor();
   //  writefln("term finished"); 
}
