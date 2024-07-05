namespace CsvConverter.Models;

public class CsvModel
{
    public int Id { get; set; }
    public string InvoiceNumber { get; set; }
    public int ClientId { get; set; }
    public string Description { get; set; }
    public int NumberOfItems { get; set; }

    public static CsvModel Create(int id, string invoiceNumber, int clientId, string description, int numberOfItems) => new()
    {
        Id = id,
        InvoiceNumber = invoiceNumber,
        ClientId = clientId,
        Description = description,
        NumberOfItems = numberOfItems
    };
}
