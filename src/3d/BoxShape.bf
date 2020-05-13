using System;

namespace ari
{
	class BoxShape : Node3D
	{
		public TextureHandle* Texture;
		public SubMeshHandle* SubMesh;

		public this(Node3dHandle _handle) : base(_handle)
		{

		}

		struct BoxShapeMembers
		{
			public TextureHandle* Texture;
			public SubMeshHandle* SubMesh;
		};

		[CLink]
		static extern BoxShapeMembers GetBoxShapeMembers(void* _node);

		protected override void Init()
		{
			base.Init();
			var m = GetBoxShapeMembers(handle._obj);
			Texture = m.Texture;
			SubMesh = m.SubMesh;
		}
	}
}
