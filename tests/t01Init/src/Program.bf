using System;

namespace t01Init
{
	class Program
	{
		public static void Main()
		{
			var setup = scope ari.GfxSetup();
			Console.WriteLine("w: {0}", setup.window.Width);
			setup.window.Width = 640;
			setup.window.Height = 480;
			ari.Gfx.SetupGfx(setup);
			while (true)
			{
				System.Threading.Thread.Sleep(1000);
			}
		}

	}
}
