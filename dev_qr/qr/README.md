# qr

> qr project next version
重新构建二维码签到系统
利用vue框架。


利用Element-ui库
步骤：
安装依赖：cnpm i element-ui -S 
安装插件按需引入：
cnpm install babel-plugin-component -D
修改.babelrc文件
```
 "plugins": [
    ["component", {
      "libraryName": "element-ui",
      "styleLibraryName": "theme-default"
    }, "transform-runtime"]
  ],
```
主要是这块。
剩下的步骤则是阅读官网引入即可。


使用stylus
步骤参考：http://blog.csdn.net/weixin_37595918/article/details/70577720
奇怪的是不需要设置webpack.base.conf.js 文件中rules
修改之后反而出错。。。
两者都有作用。


建立后端服务器
npm run server
启动服务



## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
