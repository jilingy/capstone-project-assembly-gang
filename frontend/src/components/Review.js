import React, { useEffect, useState } from 'react';
import { Button, Modal, Form, Input, Rate, message} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';
import TextArea from 'antd/lib/input/TextArea';


const key = 'updatable';
const desc = ['terrible', 'bad', 'normal', 'good', 'wonderful'];

function Review(props) {

    
    const [addedReview, setAddedReview] = useState(false);
    const [allReviews, setAllReviews] = useState([]);
    const [triggerUpdate, setTriggerUpdate] = useState(0);
    const [value, setValue] = useState(0)


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
                setAddedReview(true);
            }, 1000);
            
        }).catch(err => {
            console.log(err)
        })
        //console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
        
    };

    const handleError = () => {
        
        
    };

    
   
    

    const { TextArea } = Input;

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
            destroyOnClose={true}
            onCancel={handleCancel}          
            
            footer={[
                <Button key="back" onClick={handleCancel} style={{right: 100, position: 'relative'}}>
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
                            <p>
                            <TextArea rows={8} name="reviewText" > 
                            
                            </TextArea>
                            </p>
                        </div>
                    }  
                />
                <b><label>Rating</label></b>
                <br></br>
                <Controller
                    name="reviewRating"
                    control={control}
                    type= "number"
                    rules={{ required: "Please enter a rating" }}
                    as={
                        <Rate />
                        
                       
                    }  
                    
                />   
                 <Button type="primary" htmlType="submit" loading={props.loading} onClick={handleOk, handleError} style={{left: 260, top: 67, position: 'relative'}}>Submit</Button>
                    
               
 
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