using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace NewsProject.Commons
{
    internal static partial class FileHelper
    {
    }

    internal static partial class FileHelper
    {
        public static string Read(string path)
        {
            try
            {
                return File.ReadAllText(path);
            }
            catch (Exception e)
            {
                return String.Empty;
            }
        }

        public static IEnumerable<string> ReadLines(string path, short linesize)
        {
            try
            {
                return System.IO.File.ReadLines(path).Take(linesize);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static string[] ReadAllLines(string path)
        {
            try
            {
                return System.IO.File.ReadAllLines(path);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static bool WriteLine(string path, string value)
        {
            try
            {
                using (var file = new System.IO.StreamWriter(path, true))
                {
                    file.WriteLine(value);
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public static bool WriteLine(string path, Exception ex)
        {
            try
            {
                using (var file = new System.IO.StreamWriter(path, true))
                {
                    file.WriteLine($"{DateTime.Now:yyyyMMdd}\t{ex.HResult}\t{ex.Message}\t{ex.Source}\t{ex.Data}");
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}