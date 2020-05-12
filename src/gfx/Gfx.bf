using System;

namespace ari
{
	[CRepr]
	public struct GfxSetup
	{
		public WindowSetup window = .();
		public int32 sample_count = 0;                   /* MSAA sample count */
		public int32 swap_interval = 0;                  /* the preferred swap interval (ignored on some platforms) */
	}

	public static class Gfx
	{
		[CLink]
		public static extern bool SetupGfx(GfxSetup* setup);
	}
}
