using System;

namespace ari
{
	public class Sprite2D : Node2D
	{
		public TextureHandle* Texture;

		public this(Node2dHandle _handle) : base(_handle)
		{

		}

		[CRepr]
		struct Sprite2dMembers
 		{
			 public TextureHandle* Texture;
		}

		[CLink]
		static extern Sprite2dMembers GetSprite2dMembers(void* _node);

		protected override void Init()
		{
			base.Init();
			var m = GetSprite2dMembers(handle._obj);
			Texture = m.Texture;
		}
	}
}
