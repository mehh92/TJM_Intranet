<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

    <title>TJM Intranet</title>
</head>
<body>
    <header>
        <div class="wrap-nav">
            <div class="voiture-nav">
                <img class="voiture" src="images/logo.png" alt="logo de TJM Automobile">
            </div>
            <%
                if (Session["id_user"] == null)
                {
            %>
            <div class="titre-nav">
                <h2>Intranet Entreprise</h2>
            </div>
            <%  } %>
            <%
                if (Session["id_user"] != null)
                {
                    string nom = (string) Session["nom"];
                    nom = nom.Substring(0, 1);
            %>
            <div class="header-info">
                <div class="header-infoconnexion"><%= Session["prenom"]+"."+nom%></div>
                <div><a href="Default.aspx?page=6"><img class="nav-img" src="images/deconnexion.png" width="50px" height="50px"></a></div>
            </div>

            <%  } %>
        </div>
    </header>

        
        <%
            if (Session["id_user"] == null)
            { 
        %>
            <!-- #include file="connexion.aspx" -->
         <% } %>
        
    
    <%
        if (Session["id_user"] != null)
        {
            %>
            <div class="flex-home">
                <div class="text-nav">
                    <ul class="bandeau">
                        <li><a class="effect" href="Default.aspx?page=1">Accueil</a></li>
                        <li><a class="effect" href="Default.aspx?page=2&action=edit&idemploye=<%=Session["id_user"]%>">Mon profil</a></li>
                        <li><a class="effect" href="Default.aspx?page=3">Mon plannings</a></li>
                        <%
                            if (Session["role"] != null && Session["role"].Equals("manager"))
                            {
                            %>
                        <li><a class="effect" href="Default.aspx?page=4">Gestion employés</a></li>
                        <%
                            }
                            %>
                        <li><a class="effect" href="Default.aspx?page=5">Mes fiches de paie</a></li>
                    </ul>
                </div>

                <div class="conteneur">
                    <% 

                    int page = 0;
                    if (Request["page"] != null)
                    {
                        page = int.Parse(Request["page"]);
                    } 
                    else
                    {
                        page = 0;
                    }
                    switch(page)
                    {
                        case 1: %> <!-- #include file="accueil.aspx" --><% break;
                        case 2: %> <!-- #include file="employe.aspx" --><% break;
                        case 3: %> <!-- #include file="planning.aspx" --><% break;
                        case 4: %> <!-- #include file="gestion_employe.aspx" --><% break;
                        case 5: %> <!-- #include file="paie.aspx" --><% break;
                        case 6:
                            Session.Remove("id_user");
                            Session.Abandon();
                            Response.Redirect("Default.aspx", false);
                            break;
                    }
        }
                    %>
               </div>
         </div> 


    <script src="https://unpkg.com/jspdf-invoice-template@1.4.0/dist/index.js"></script>
    <script type="text/javascript" src="script/functions.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script>

        function generatePDF() {

            var pdfObject = jsPDFInvoiceTemplate.default(props);

            console.log("Object created: ", pdfObject);

        }

        var props = {
            outputType: jsPDFInvoiceTemplate.OutputType.Save,
            returnJsPDFDocObject: true,
            fileName: "Invoice 2021",
            orientationLandscape: false,
            compress: true,
            logo: {
                src: "https://raw.githubusercontent.com/edisonneza/jspdf-invoice-template/demo/images/logo.png",
                type: 'PNG', //optional, when src= data:uri (nodejs case)
                width: 53.33, //aspect ratio = width/height
                height: 26.66,
                margin: {
                    top: 0, //negative or positive num, from the current position
                    left: 0 //negative or positive num, from the current position
                }
            },
            stamp: {
                inAllPages: true, //by default = false, just in the last page
                src: "https://raw.githubusercontent.com/edisonneza/jspdf-invoice-template/demo/images/qr_code.jpg",
                type: 'JPG', //optional, when src= data:uri (nodejs case)
                width: 20, //aspect ratio = width/height
                height: 20,
                margin: {
                    top: 0, //negative or positive num, from the current position
                    left: 0 //negative or positive num, from the current position
                }
            },
            business: {
                name: "",
                address: "",
                phone: "(+355) 069 11 11 111",
                email: "email@example.com",
                email_1: "info@example.al",
                website: "www.example.al",
            },
            contact: {
                label: "Invoice issued for:",
                name: "Client Name",
                address: "Albania, Tirane, Astir",
                phone: "(+355) 069 22 22 222",
                email: "client@website.al",
                otherInfo: "www.website.al",
            },
            invoice: {
                label: "Invoice #: ",
                num: 19,
                invDate: "Payment Date: 01/01/2021 18:12",
                invGenDate: "Invoice Date: 02/02/2021 10:17",
                headerBorder: false,
                tableBodyBorder: false,
                header: [
                    {
                        title: "#",
                        style: {
                            width: 10
                        }
                    },
                    {
                        title: "Title",
                        style: {
                            width: 30
                        }
                    },
                    {
                        title: "Description",
                        style: {
                            width: 80
                        }
                    },
                    { title: "Price" },
                    { title: "Quantity" },
                    { title: "Unit" },
                    { title: "Total" }
                ],
                table: Array.from(Array(10), (item, index) => ([
                    index + 1,
                    "There are many variations ",
                    "Lorem Ipsum is simply dummy text dummy text ",
                    200.5,
                    4.5,
                    "m2",
                    400.5
                ])),
                additionalRows: [{
                    col1: 'Total:',
                    col2: '145,250.50',
                    col3: 'ALL',
                    style: {
                        fontSize: 14 //optional, default 12
                    }
                },
                {
                    col1: 'VAT:',
                    col2: '20',
                    col3: '%',
                    style: {
                        fontSize: 10 //optional, default 12
                    }
                },
                {
                    col1: 'SubTotal:',
                    col2: '116,199.90',
                    col3: 'ALL',
                    style: {
                        fontSize: 10 //optional, default 12
                    }
                }],
                invDescLabel: "Invoice Note",
                invDesc: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.",
            },
            footer: {
                text: "The invoice is created on a computer and is valid without the signature and stamp.",
            },
            pageEnable: true,
            pageLabel: "Page ",
        };
    </script>

</body>
</html>