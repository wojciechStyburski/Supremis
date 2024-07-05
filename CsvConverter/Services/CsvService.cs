namespace CsvConverter.Services;

public class CsvService
{
    public static List<CsvModel> GetDataFromCsvSimple(string filePath)
    {
        if (!File.Exists(filePath))
        {
            throw new FileNotFoundException("File not found.");
        }

        List<CsvModel> csvModels = [];

        var lines = File.ReadAllLines(filePath).Skip(1);

        foreach (var line in lines)
        {
            var lineDetails = line.Split(';');

            var id = Convert.ToInt16(lineDetails[0]);
            var invoiceNumber = lineDetails[1];
            var clientId = Convert.ToInt16(lineDetails[2]);
            var description = lineDetails[3];
            var items = Convert.ToInt16(lineDetails[4]);

            CsvModel csvModel = CsvModel.Create(id, invoiceNumber, clientId, description, items);

            csvModels.Add(csvModel);
        }

        return csvModels;
    }

    public static List<CsvModel> GetDataFromCsvHelper(string filePath)
    {
        if (!File.Exists(filePath))
        {
            throw new FileNotFoundException("File not found.");
        }

        using StreamReader streamReader = new(filePath);

        var config = new CsvConfiguration(CultureInfo.InvariantCulture)
        {
            HasHeaderRecord = true,
            Delimiter = ";"
        };

        using CsvReader csvReader = new(streamReader, config);
        csvReader.Context.RegisterClassMap<CsvModelMapper>();

        var records = csvReader.GetRecords<CsvModel>().ToList();

        return records;
    }
}
