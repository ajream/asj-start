## 爱上家内部服务系统

### 开发目的：将公司部分行为网络化，方便员操作，方便行政监督

### 环境要求：ruby 2.5.0, rails 5.2

### 页面目前包含包括：
  * 登录页面
  * 登记买菜记录
  * 订餐页面
    - 十点前
    - 十点后
  * 订餐后可查看当前订餐人员，可取消自己的订餐（十一点前）
  * 管理员看到的点餐页面，可以记录谁点餐，谁未点餐

### 用户角色：
  * 普通用户：可以点餐和取消订餐

### 其他要求：
  * 目前用户只可看到当天数据
  * 不用考虑分页
