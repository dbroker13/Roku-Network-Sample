sub init()
    m.top.functionName = "doRequest"
end sub

function doRequest() as void
    url = "https://dog.ceo/api/breeds/list/all"

    print "HttpTask: requesting "; url

    xfer = CreateObject("roUrlTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetUrl(url)

    response = xfer.GetToString()

    if response <> invalid and response <> ""
        m.top.result = { success: true, body: response }
    else
        m.top.result = { success: false, body: "" }
    end if
end function
