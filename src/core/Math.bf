using System;

namespace ari
{
	[CRepr]
	public struct Vector2
	{
		public float x;
		public float y;

		public this(float _x, float _y)
		{
			x = _x;
			y = _y;
		}

		public void Set(float _x, float _y) mut
		{
			x = _x;
			y = _y;
		}

		public void Set(float _v) mut
		{
			x = y = _v;
		}

		public static Vector2 operator * (Vector2 lhd, float rhd)
		{
			return Vector2(lhd.x * rhd, lhd.y * rhd);
		}

		public static Vector2 operator + (Vector2 lhd, float rhd)
		{
			return Vector2(lhd.x + rhd, lhd.y + rhd);
		}

		public static Vector2 operator + (Vector2 lhd, Vector2 rhd)
		{
			return Vector2(lhd.x + rhd.x, lhd.y + rhd.y);
		}
	}

	[CRepr]
	public struct Vector3
	{
		public float x;
		public float y;
		public float z;

		public void Set(float _x, float _y, float _z) mut
		{
			x = _x;
			y = _y;
			z = _z;
		}

		public void Set(float _v) mut
		{
			x = y = z = _v;
		}
	}

	[CRepr]
	public struct Quat
	{
		public float x;
		public float y;
		public float z;
		public float w;

		public this(float _x, float _y, float _z, float _w)
		{
			x = _x;
			y = _y;
			z = _z;
			w = _w;
		}

	}

	[CRepr]
	public struct Color
	{
		public float r;
		public float g;
		public float b;
		public float a;

		public this(float _r, float _g, float _b, float _a)
		{
			r = _r;
			g = _g;
			b = _b;
			a = _a;
		}

		public static Color LIGHTGRAY = Color(0.784f, 0.784f, 0.784f, 1);
		public static Color GRAY = Color(0.509f, 0.509f, 0.509f, 1);
		public static Color DARKGRAY = Color(0.313f, 0.313f, 0.313f, 1);
		public static Color YELLOW = Color(0.992f, 0.976f, 0, 1);
		public static Color GOLD = Color(1, 0.796f, 0, 1);
		public static Color ORANGE = Color(1, 0.631f, 0, 1);
		public static Color PINK = Color(1, 0.427f, 0.76f, 1);
		public static Color RED = Color(0.901f, 0.16f, 0.215f, 1);
		public static Color MAROON = Color(0.745f, 0.129f, 0.215f, 1);
		public static Color GREEN = Color(0, 0.894f, 0.188f, 1);
		public static Color LIME = Color(0, 0.619f, 0.184f, 1);
		public static Color DARKGREEN = Color(0, 0.458f, 0.172f, 1);
		public static Color SKYBLUE = Color(0.4f, 0.749f, 1, 1);
		public static Color BLUE = Color(0, 0.474f, 0.945f, 1);
		public static Color DARKBLUE = Color(0, 0.321f, 0.674f, 1);
		public static Color PURPLE = Color(0.784f, 0.748f, 1, 1);
		public static Color VIOLET = Color(0.529f, 0.235f, 0.745f, 1);
		public static Color DARKPURPLE = Color(0.439f, 0.121f, 0.494f, 1);
		public static Color BEIGE = Color(0.827f, 0.69f, 0.513f, 1);
		public static Color BROWN = Color(0.498f, 0.415f, 0.309f, 1);
		public static Color DARKBROWN = Color(0.298f, 0.247f, 0.184f, 1);
		public static Color WHITE = Color(1, 1, 1, 1);
		public static Color BLACK = Color(0, 0, 0, 1);
		public static Color BLANK = Color(0, 0, 0, 0);
		public static Color MAGENTA = Color(1, 0, 1, 1);
		public static Color RAYWHITE = Color(0.9607f, 0.9607f, 0.9607f, 1);
	}

	[CRepr]
	public struct Rect<T>
	{
		public T x;
		public T y;
		public T width;
		public T height;
	}

	typealias RectI = Rect<int32>;
}
