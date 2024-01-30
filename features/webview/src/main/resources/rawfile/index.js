// vscode折叠所有代码 cmd+k, cmd+0
// vscode打开所有代码 cmd+k,cmd+j

const b_1 = [
  {
    name: "获取用户token",
    param: { type: "1" },
  },
];

const b_2 = [
  {
    name: "设置Web导航标题",
    param: { type: "2", data: "鸿蒙Web导航" },
  },
];

const b_3 = [
  {
    name: "设置导航栏背景色",
    param: {
      type: "3",
      colorArr: ["#FFFFFF", "#508CEE"],
    },
  },
];

const b_14 = [
  {
    name: "设置隐藏返回键和关闭键",
    param: {
      type: "14",
      hidden: 1,
    },
  },
];

const b_74 = [
  {
    name: "获取Web导航栏高度",
    param: {
      type: "74",
    },
  },
];

const AllBridges = [];
const pushBridge = (bridgeNo, bridges) => {
  bridges.forEach((item) => {
    item.type = bridgeNo;
  });
  AllBridges.push(...bridges);
};

pushBridge(2, b_2);
pushBridge(3, b_3);
pushBridge(14, b_14);
pushBridge(74, b_74);

const container = document.querySelector(".wrapper-btn");

let callJSBridge = (item) => {
  const registerData = item.param;
  JrBridge.callNative(registerData, function (data) {
    //将信息通过弹窗打印出来
    if (typeof data == "object") data = JSON.stringify(data);
    alert(data);
  });
};

AllBridges.forEach((item) => {
  const el = document.createElement("button");
  el.className = "bridge-btn";
  el.textContent = `${item.type}号桥: ${item.name}`;
  container.appendChild(el);
  el.onclick = () => {
    callJSBridge(item);
  };
});
