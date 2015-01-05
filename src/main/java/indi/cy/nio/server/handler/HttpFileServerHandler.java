package indi.cy.nio.server.handler;

import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.FullHttpRequest;

public class HttpFileServerHandler extends SimpleChannelInboundHandler<FullHttpRequest> {

	@Override
	protected void messageReceived(ChannelHandlerContext ctx,
			FullHttpRequest arg1) throws Exception {
		System.out.println("handle this request");
		ChannelFuture future = ctx.writeAndFlush("aaa");
		ctx.channel().close();
	}

}
