using System;

namespace ari
{
	[CRepr]
	public struct WindowSetup
	{
		public int32 Width = 640;
		public int32 Height = 480;
		public bool FullScreen = false;
		public bool HighDpi = false;
		public float DpiScale = 1.0f;
	}

	[CRepr]
	public struct GfxSetup
	{
		public WindowSetup window = .();
		public int32 sample_count = 0;                   /* MSAA sample count */
		public int32 swap_interval = 0;                  /* the preferred swap interval (ignored on some platforms) */
	}

	public class Application
	{
		public virtual GfxSetup GetGfxSetup()
		{
			return GfxSetup();
		}
	}
}
