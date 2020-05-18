using System;

namespace ari
{
	public abstract class RPC
	{
		public abstract bool Serialize(void* stream);
		public abstract bool Deserialize(void* stream);
		public abstract bool SerializeMeasure(void* stream);

		// Call the function
		public abstract void Call();

		// Clone the RPC
		public abstract RPC Clone();

		// Delete the delegate
		public abstract void Delete();

		public virtual void SetParam1(void* param) {}
		public virtual void SetParam2(void* param) {}
		public virtual void SetParam3(void* param) {}
		public virtual void SetParam4(void* param) {}
		public virtual void SetParam5(void* param) {}
		public virtual void SetParam6(void* param) {}
		public virtual void SetParam7(void* param) {}
		public virtual void SetParam8(void* param) {}
		public virtual void SetParam9(void* param) {}

		public String function_name;
		public uint32 function_hash = 0;
		public RpcType rpc_type;
		public bool Reliable = false;
	}

	// RPC0
	public class RPC0 : RPC
	{
		public delegate void fnDel();
		public fnDel fn = null;

		public override bool Serialize(void* stream)
		{
			return true;
		}

		public override bool Deserialize(void* stream)
		{
			return true;
		}

		public override bool SerializeMeasure(void* stream)
		{
			return true;
		}

		public override void Call()
		{
			Runtime.Assert(fn != null);
			fn();
		}

		public override RPC Clone()
		{
			RPC0 rpc = new RPC0();
			rpc.fn = fn;
			return rpc;
		}

		public override void Delete()
		{
			delete fn;
		}
	}

	// RPC1
	public class RPC1<P1> : RPC
	{
		public delegate void fnDel(P1 _p1);
		public fnDel fn = null;
		P1 p1;

		public override bool Serialize(void* stream)
		{
			return NetSerializer.Serialize<P1>(stream, p1);
		}

		public override bool Deserialize(void* stream)
		{
			return NetSerializer.Deserialize<P1>(stream, p1);
		}

		public override bool SerializeMeasure(void* stream)
		{
			return NetSerializer.SerializeMeasure<P1>(stream, p1);
		}

		public override void SetParam1(void* param)
		{
			p1 = *((P1*)param);
		}

		public override void Call()
		{
			Runtime.Assert(fn != null);
			fn(p1);
		}

		public override RPC Clone()
		{
			RPC1<P1> rpc = new RPC1<P1>();
			rpc.fn = fn;
			return rpc;
		}

		public override void Delete()
		{
			delete fn;
		}
	}
}
