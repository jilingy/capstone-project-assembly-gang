import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Button, Popover, Select, message, Modal } from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';


function Review(props) {

    const handleOk = () => {
        // We passed in the book from the Card Component 
        // and access it using props!
        console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
    };

    return (
        <Modal
            title={props.book.book_title}
            visible={props.visible}
            onOk={handleOk}
            onCancel={handleCancel}
            >
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