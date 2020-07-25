import React, { useEffect, useState } from 'react';
import { Button, Modal, Form, Input, Rate, message} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';
import TextArea from 'antd/lib/input/TextArea';

const key = 'updatable';

function Review(props) {

    const [value, setValue] = useState(0);
    const [text, setText] = useState("");
    const [addedReview, setAddedReview] = useState(false);
    const [allReviews, setAllReviews] = useState([]);
    const [triggerUpdate, setTriggerUpdate] = useState(0);


    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "reviewText": '',
            "reviewRating": 0,
        },
    });

    useEffect(() => {
        getAllReviews();
    }, [addedReview, triggerUpdate, props.id])


    const addReviewSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.success({ content: 'Review created successfully!', key, duration: 2 });
            }, 1000);
    };

    const getAllReviews = () =>{
        apiReviews.getAll()
        .then(res => {
            setAllReviews(res.data)
        })
    }

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
            }, 1000);
            setAddedReview(true);
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

    const changingText = text => {
        setText(text)
    };

    const handleEdit = book_id => {
        //console.log(allReviews)
        var filtered = allReviews.filter(review => {
            if(props.book.id === review.book && parseInt(props.user_id) === review.user){
                return review;
            }
        })
        console.log(filtered)
        setText(filtered[0].review)
        setTriggerUpdate(triggerUpdate+1)
    };

    let button;
    if (addedReview) {
        button = <Button type= "primary" onClick={handleEdit} style={{left: 100, bottom: 400, position: 'relative'}} >Edit</Button>
    } else {
        button = null
    }

    const { TextArea } = Input;

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
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
                            <TextArea rows={8} name="reviewText" defaultValue={text} >
                            onChange={changingText} 
                            value={text}  
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
                        <Rate name="reviewRating">
                            onChange={handleChange} 
                            value={value}    
                        </Rate>
                    }  
                />   
                 <Button type="primary" htmlType="submit" loading={props.loading} onClick={handleOk} style={{left: 260, top: 67, position: 'relative'}}>Submit</Button>
                    
                 {button}   
 
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