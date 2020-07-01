import React from 'react'
import { Form, Input, Button, Checkbox, Typography } from 'antd'
import { Link } from 'react-router-dom';

export default function Login() {

    /*const onSubmit = (data) => {
      console.log(data);
      if(!data) return;
    }
    */

    const {Title} = Typography
    const layout = {
        labelCol: {
          span: 10,
        },
        wrapperCol: {
          span: 4,
        },
      };
    const tailLayout = {
        wrapperCol: {
          offset: 7,
          span: 13,
        },
      };
    const headLayout = {
        wrapperCol: {
          offset: 6,
          span: 7,
        },
    };

    return(
    <div>
    <Title
      level={3}
    >
      Login
    </Title>
    <Form
      {...layout}
      name="basic"
      initialValues={{
        remember: true,
      }}
    >
      <Form.Item
        label="Username"
        name="username"
        rules={[
          {
            required: true,
            message: 'Please input your username!',
          },
        ]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Password"
        name="password"
        rules={[
          {
            required: true,
            message: 'Please input your password!',
          },
        ]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item {...headLayout} name="remember" valuePropName="checked">
        <Checkbox>Remember me</Checkbox>
      </Form.Item>

      <Form.Item {...tailLayout}>
        <Button type="primary" htmlType="submit">
          Log In
        </Button>
      </Form.Item>
    </Form>
    <Link to="/register">Register for an Account</Link>
    </div>
    )

}
