using System;

namespace ari
{
	public class ServerSystem: AriSystem
	{
		[CLink]
		static extern void* CreateServerSystem();

		public this()
		{
			_obj = CreateServerSystem();
		}

		[CLink]
		static extern void DeleteServerSystem(void* _obj);

		public ~this()
		{
			DeleteServerSystem(_obj);
			_obj = null;
		}

		[CLink]
		static extern bool CreateServerServerSystem(void* _obj, char8* ip, int port);

		public bool CreateServer(char8* ip, int port)
		{
			return CreateServerServerSystem(_obj, ip, port);
		}

		[CLink]
		static extern void StopServerSystem(void* _obj);

		public void StopServer()
		{
			StopServerSystem(_obj);
		}
	}
}
