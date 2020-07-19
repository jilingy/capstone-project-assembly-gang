import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message, Modal, Form, Input} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';


function Review(props) {

    const handleOk = () => {
        apiReviews.post({
            user: props.user_id,
            book: props.book.book_title,
            review: data,
            rating: data,

        }).catch(err => {
            console.log(err)
        })
        props.updateLoading(!props.loading);
        setTimeout(() => {
            props.updateLoading(props.loading);
            props.updateVisible(!props.visible);
        }, 3000);
        console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
    };

    const layout = {
        labelCol: {
          span: 4
        }
      };

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
            onOk={handleOk}
            onCancel={handleCancel}
            
            
           
            footer={[
                <Button key="back" onClick={handleCancel}>
                    Cancel
                </Button>,
                <Button
                    key="submit"
                    type="primary"
                    loading={props.loading}
                    onClick={handleOk}
                >
                    Submit
                </Button>
                ]}
                >
                
                <Form {...layout} name="nest-messages">
                <Form.Item name={["user", "review"]} label="Review">
                <Input.TextArea rows={8} />
                </Form.Item>
                </Form>

            
            <p>{props.book.book_synopsis}</p>
            <p>USER ID - {props.user_id}</p>
            <p>Some contents...</p>


        </Modal>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}


export default connect(mapStateToProps)(Review);