using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Linq;


	partial class RandomImage : System.Web.UI.Page
	{
		private void Page_Load(object sender, EventArgs e)
		{
			string str = ValidateCode(4);
			DrawValidateCode(str,50,100);
		}
  
		private void DrawValidateCode(string str,int f,int b)
		{
			if(str == null || str.Trim() == String.Empty)
			{
				return;
			}
			else
			{
				Bitmap bmpImage = new Bitmap((int)Math.Ceiling((str.Length * 12.5)), 22);
				Graphics g = Graphics.FromImage(bmpImage);
    
				try
				{
					Random rand = new Random();
    
					g.Clear(Color.White);
    
					for(int i=0; i<b; i++)
					{
						int x1 = rand.Next(bmpImage.Width);
						int x2 = rand.Next(bmpImage.Width);
						int y1 = rand.Next(bmpImage.Height);
						int y2 = rand.Next(bmpImage.Height);
    
						g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
					}
					Font font = new Font("Arial", 12, (FontStyle.Bold | FontStyle.Italic));
					LinearGradientBrush brush = new LinearGradientBrush(new Rectangle(0, 0, bmpImage.Width, bmpImage.Height), Color.Blue, Color.DarkRed, 1.2f, true);
					g.DrawString(str, font, brush, 2, 2);
    
					
					for(int i=0; i<f; i++)
					{
						int x = rand.Next(bmpImage.Width);
						int y = rand.Next(bmpImage.Height);
    
						bmpImage.SetPixel(x, y, Color.FromArgb(rand.Next()));
					}
    
					g.DrawRectangle(new Pen(Color.Silver), 0, 0, bmpImage.Width - 1, bmpImage.Height - 1);
    
					MemoryStream memsMemoryStream = new MemoryStream();
					bmpImage.Save(memsMemoryStream, ImageFormat.Gif);
					Response.ClearContent();
					Response.ContentType = "image/Gif";
					Response.BinaryWrite(memsMemoryStream.ToArray());
				}
				finally
				{
					g.Dispose();
					bmpImage.Dispose();
				}
			}
		}

    

        private string ValidateCode(int length)
		{
			int number;
			char code;
			string str = String.Empty;
    
			Random rand = new Random();
    
			for(int i=0;i<length;i++)
			{
				number = rand.Next();
				if(number % 2 == 0)
				{
					code = (char)('0' + (char)(number % 10));
				}
				else
				{
					code = (char)('A' + (char)(number % 26));
				}
				str += code.ToString(); 
			}
    
			Session["Code"] = str;    
			return str;
		}

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
