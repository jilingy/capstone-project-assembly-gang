import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message, Modal } from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';


function Review(props) {

    const handleOk = () => {
       // Send data through to backend here...
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
    };

    return (
        <Modal
            title="Basic Modal"
            visible={props.visible}
            onOk={handleOk}
            onCancel={handleCancel}
            >
            <p>Some contents...</p>
            <p>Some contents...</p>
            <p>Some contents...</p>
        </Modal>
    )
}

export default Review;