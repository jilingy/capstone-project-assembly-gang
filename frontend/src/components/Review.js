import React, { useEffect, useState } from 'react';
import { Button, Modal, Form, Input, Rate, message} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';
import TextArea from 'antd/lib/input/TextArea';

const key = 'updatable';

function Review({props, setLen: setLength, len: Length}) {

    const [value, setValue] = useState(0);

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "reviewText": '',
            "reviewRating": 0,
        },
    });

    const addReviewSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.success({ content: 'Review created successfully!', key, duration: 2 });
                setLength(Length + 1);
            }, 1000);
    };

    const handleOk = (data) => {
        console.log(data);
        apiReviews.post({
            user: props.user_id,
            book: props.book.id,
            review: data.reviewText,
            rating: data.reviewRating,
        }).then(res => {
            props.updateLoading(!props.loading);
            addReviewSuccess();
            setTimeout(() => {
                props.updateLoading(props.loading);
                props.updateVisible(!props.visible);
            }, 3000);
        }).catch(err => {
            console.log(err)
        })
        //console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
        
    };

    const handleChange = value => {
        setValue(value)
      };

    const { TextArea } = Input;

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
            onCancel={handleCancel}          
            
            footer={[
                <Button key="back" onClick={handleCancel} style={{right: 95, position: 'relative'}}>
                    Cancel
                </Button>,
            ]}
        >

            <b><label>Book Synopsis</label></b>
            <p>{props.book.book_synopsis}</p>

            <form
            className="reviewForm"
            onSubmit={handleSubmit(handleOk)}>
                <Controller
                    name="reviewText"
                    control={control}
                    rules={{ required: "Please enter a review" }}
                    as={
                        <div>
                            <b><label>Review</label></b>
                            <TextArea rows={8} name="reviewText" />
                        </div>
                    }  
                />

                <Controller
                    name="reviewRating"
                    control={control}
                    type= "number"
                    rules={{ required: "Please enter a rating" }}
                    as={
                        <Rate name="reviewRating">
                            onChange={handleChange} 
                            value={value}    
                        </Rate>
                    }  
                />   
                 <Button type="primary" htmlType="submit" loading={props.loading} onClick={handleOk} style={{left: 400, top: 67, position: 'relative'}}>Submit</Button>
                
 
            </form>    

        </Modal>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}


export default connect(mapStateToProps)(Review);