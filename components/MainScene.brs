sub init()
    m.label = m.top.findNode("statusLabel")

    ' Create and start the HTTP Task
    m.httpTask = CreateObject("roSGNode", "HttpTask")
    m.httpTask.observeField("result", "onHttpResult")
    m.httpTask.control = "RUN"

    m.label.text = "Requesting..."
end sub

sub onHttpResult()
    result = m.httpTask.result
    if result.success
        m.label.text = "SUCCESS!"
        m.label.color = "0x00FF00FF"  ' green
        print "HTTP SUCCESS: "; left(result.body, 200); "..."
    else
        m.label.text = "FAILED!"
        m.label.color = "0xFF0000FF"  ' red
        print "HTTP FAILED"
    end if
end sub
