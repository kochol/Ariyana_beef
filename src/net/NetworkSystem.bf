using System;

namespace ari
{
	public abstract class NetworkSystem: AriSystem
	{
		protected enum SystemNetworkType
		{
			Server,
			Client,
			DedicatedServer
		}

		protected SystemNetworkType m_network_type;

		protected abstract void SendRPC(RPC _rpc, int client_index);

		void CallRPC_internal(RPC rpc, int client_index = -1)
		{
			if (client_index == -1)
			{
				Runtime.Assert(rpc.rpc_type != RpcType.Client);
				Runtime.Assert((rpc.rpc_type == RpcType.Server
					&& m_network_type == SystemNetworkType.Client)
					|| rpc.rpc_type == RpcType.MultiCast);
			}
			else
				Runtime.Assert(rpc.rpc_type == RpcType.Client);

			if (rpc.rpc_type == RpcType.MultiCast)
			{
				rpc.Call(); // Also call on sender
				if (m_network_type == SystemNetworkType.Client)
					return;
			}

			SendRPC(rpc, client_index);
		}

		public void CallRPC(RPC _rpc)
		{
			CallRPC_internal(_rpc);
		}

		public void CallRPC(int client_index, RPC _rpc)
		{
			CallRPC_internal(_rpc, client_index);
		}

	}
}
