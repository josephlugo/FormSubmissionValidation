Imports System.Data.Entity.Core.EntityClient
Imports System.Data.SqlClient

Module Configuration

    Public Function CONNECTION_STRING()

        Try

            ' Initialize the connection string builder for the
            ' underlying provider.
            Dim sqlBuilder As New SqlConnectionStringBuilder

            ' Set the properties for the data source.
            sqlBuilder.DataSource = "."
            sqlBuilder.InitialCatalog = "Northwind"
            sqlBuilder.IntegratedSecurity = True

            ' Build the SqlConnection connection string.
            Dim providerString As String = sqlBuilder.ToString

            ' Initialize the EntityConnectionStringBuilder.
            Dim entityBuilder As New EntityConnectionStringBuilder

            'Set the connection string name
            'entityBuilder.Name = "Mainframe_DataEntities"
            'Set the provider name.
            entityBuilder.Provider = "System.Data.SqlClient"
            ' Set the provider-specific connection string.
            entityBuilder.ProviderConnectionString = providerString
            'entityBuilder.ProviderConnectionString = Configuration.CONNECTION_STRING
            ' Set the Metadata location to the current directory.
            entityBuilder.Metadata = "res://*/FSVModel.csdl|res://*/FSVModel.ssdl|res://*/FSVModel.msl"

            Return entityBuilder.ToString

        Catch ex As Exception
            Throw ex
        End Try

    End Function

End Module
