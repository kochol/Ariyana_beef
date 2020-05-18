using System;

namespace ari
{
	public class ServerSystem: NetworkSystem
	{
		[CLink]
		static extern void* CreateServerSystem();

		public this()
		{
			m_network_type = SystemNetworkType.Server;
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

		[CLink]
		static extern void CallCRPCServerSystem(void* _obj, void* _rpc, bool _reliable, RpcType _rpc_type, int client_id);

		protected override void SendRPC(RPC _rpc, int client_index)
		{
			CallCRPCServerSystem(_obj, Internal.UnsafeCastToPtr(_rpc), _rpc.Reliable, _rpc.rpc_type, client_index);
		}

	}
}
