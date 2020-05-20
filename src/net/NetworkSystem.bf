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

		public void CallRPC<P1>(RPC _rpc, P1 p1)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1>(int client_index, RPC _rpc, P1 p1)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			CallRPC_internal(_rpc, client_index);
		}
		
		public void CallRPC<P1, P2>(RPC _rpc, P1 p1, P2 p2)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2>(int client_index, RPC _rpc, P1 p1, P2 p2)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3>(RPC _rpc, P1 p1, P2 p2, P3 p3)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4, P5>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4, P5>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7, P8>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			var c8 = p8;
			_rpc.SetParam8(&c8);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7, P8>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			var c8 = p8;
			_rpc.SetParam8(&c8);
			CallRPC_internal(_rpc, client_index);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7, P8, P9>(RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8, P9 p9)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			var c8 = p8;
			_rpc.SetParam8(&c8);
			var c9 = p9;
			_rpc.SetParam9(&c9);
			CallRPC_internal(_rpc);
		}

		public void CallRPC<P1, P2, P3, P4, P5, P6, P7, P8, P9>(int client_index, RPC _rpc, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8, P9 p9)
		{
			var c1 = p1;
			_rpc.SetParam1(&c1);
			var c2 = p2;
			_rpc.SetParam2(&c2);
			var c3 = p3;
			_rpc.SetParam3(&c3);
			var c4 = p4;
			_rpc.SetParam4(&c4);
			var c5 = p5;
			_rpc.SetParam5(&c5);
			var c6 = p6;
			_rpc.SetParam6(&c6);
			var c7 = p7;
			_rpc.SetParam7(&c7);
			var c8 = p8;
			_rpc.SetParam8(&c8);
			var c9 = p9;
			_rpc.SetParam9(&c9);
			CallRPC_internal(_rpc, client_index);
		}

	}
}
