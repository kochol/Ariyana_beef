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
