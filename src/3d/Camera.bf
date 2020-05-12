using System;

namespace ari
{

	public class Camera	: Node3D
	{
		public Vector3* Target;

		public this(Node3dHandle _handle) : base(_handle)
		{
		}

		[CLink]
		static extern Vector3* GetCameraTarget(void* _node);

		public override void Init()
		{
			base.Init();
			Target = GetCameraTarget(handle._obj);
		}
	}
}
