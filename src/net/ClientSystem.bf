using System;

namespace ari
{
	public class ClientSystem: AriSystem
	{
		[CLink]
		static extern void* CreateClientSystem();

		public this()
		{
			_obj = CreateClientSystem();
		}

		[CLink]
		static extern void DeleteClientSystem(void* _obj);

		public ~this()
		{
			DeleteClientSystem(_obj);
			_obj = null;
		}

		[CLink]
		static extern void ConnectClientSystem(void* _obj, char8* ip, int port);

		public void Connect(char8* ip, int port)
		{
			ConnectClientSystem(_obj, ip, port);
		}

		[CLink]
		static extern void StopClientSystem(void* _obj);

		public void StopClient()
		{
			StopClientSystem(_obj);
		}
	}
}
