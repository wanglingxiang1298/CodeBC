using System;
using System.Net.NetworkInformation;
class Program
{
    static void Main(string[] args)
    {
        var interfaces = NetworkInformation.GetInstalledNetworkInterfaces();
        foreach (var interface in interfaces)
        {
            foreach (var address in interface.IPAddresses)
            {
                Console.WriteLine($"Interface: {interface.Name} - IP Address: {address.IPAddress}");
            }
        }
    }
}