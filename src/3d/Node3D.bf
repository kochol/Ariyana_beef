using System;

namespace ari
{
	[CRepr]
	public struct Node3dHandle
	{	
		public uint32 Handle = uint32.MaxValue;
		public uint32 Index = uint32.MaxValue;
		public void* _obj = null;

		[CLink]
		static extern bool IsValidNode3D(ref uint32 _cameraHandle);

		bool IsValid() mut
		{
			if (Handle == uint32.MaxValue || Index == uint32.MaxValue)
				return false;

			return IsValidNode3D(ref Handle);
		}
	}

	public class Node3D
	{
		public Vector3* Position;

		protected Node3dHandle handle;

		public this(Node3dHandle _handle)
		{
			this.handle = _handle;
		}

		[CLink]
		static extern Vector3* GetNode3dPosition(void* _node);

		public virtual void Init()
		{
			Runtime.Assert(handle._obj != null);
			Position = GetNode3dPosition(handle._obj);
		}
	}
}
