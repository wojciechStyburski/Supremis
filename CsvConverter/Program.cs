string filePath = "D:\\Temp\\file_to_import.csv";


Console.WriteLine("============================SIMPLE============================");

var resultSimple = CsvService.GetDataFromCsvSimple(filePath);
Console.WriteLine("Id | Invoice_Number | Client_Id | Description | Number_Of_Items");
foreach (var item in resultSimple)
{
    Console.WriteLine($"{item.Id} | {item.InvoiceNumber} | {item.ClientId} | {item.Description} | {item.NumberOfItems}");
}

Console.WriteLine("============================CSV_HELPER============================");

var resultHelper = CsvService.GetDataFromCsvHelper(filePath);
Console.WriteLine("Id | Invoice_Number | Client_Id | Description | Number_Of_Items");
foreach (var item in resultHelper)
{
    Console.WriteLine($"{item.Id} | {item.InvoiceNumber} | {item.ClientId} | {item.Description} | {item.NumberOfItems}");
}