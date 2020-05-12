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

	public static class Io
	{
		[CLink]
		public static extern void UpdateIo();

		[CLink]
		public static extern bool Run();
	}

}
