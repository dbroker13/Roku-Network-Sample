sub init()
    m.label = m.top.findNode("statusLabel")
    m.label.text = "Preparing network test..."
    m.label.color = &hFFFFFFFF

    m.httpTask = CreateObject("roSGNode", "HttpTask")
    m.httpTask.observeField("result", "onHttpResult")
    m.top.appendChild(m.httpTask)

    print "Starting HTTP task..."
    m.httpTask.control = "RUN"
end sub

sub onHttpResult()
    result = m.httpTask.result
    if result.success
        print "HTTP SUCCESS: "; left(result.body, 200)
        m.label.text = "SUCCESS!"
        m.label.color = &hFF00FF00
    else
        print "HTTP FAIL: code="; result.code
        m.label.text = "FAIL: " + str(result.code)
        m.label.color = &hFFFF0000
    end if
end sub
